import 'package:artools/artools.dart';
import 'package:dio/dio.dart';

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(
        code: -1,
        message: "connection-timed",
      );
    case DioExceptionType.sendTimeout:
      return ErrorEntity(
        code: -1,
        message: "send-timed",
      );

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(
        code: -1,
        message: "receive-timed",
      );

    case DioExceptionType.cancel:
      return ErrorEntity(
        code: -1,
        message: "server-canceled",
      );

    case DioExceptionType.unknown:
      return ErrorEntity(
        code: -1,
        message: "check-internet",
      );

    case DioExceptionType.badResponse:
      String errorMessage = "unexpected-error";
      if (error.response != null && error.response!.data != null) {
        var responseData = error.response!.data;
        if (responseData is JsonMap && responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        }
      }
      return ErrorEntity(
        code: error.response!.statusCode!,
        message: errorMessage,
      );
    default:
      return ErrorEntity(code: -1, message: "unknown");
  }
}
