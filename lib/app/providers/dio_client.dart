import 'package:artools/artools.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../exceptions/network_exceptions.dart';
import '../routes/app_routes.dart';
import '../services/background/user_service.dart';

class DioClient {
  static DioClient? _instance;

  factory DioClient({CacheOptions? cacheOptions}) {
    _instance ??= DioClient._internal(cacheOptions: cacheOptions);
    return _instance!;
  }

  static const String _baseURL = "https://your_base_url/";
  late Dio _dio;
  late CacheOptions? cacheOptions;

  DioClient._internal({this.cacheOptions}) {
    BaseOptions options = BaseOptions(
      baseUrl: _baseURL,
      connectTimeout: const Duration(),
      receiveTimeout: const Duration(),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    final defaultCacheOptions = CacheOptions(
      store: MemCacheStore(),
      hitCacheOnErrorExcept: [401, 403, 404],
      maxStale: const Duration(minutes: 5),
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      keyBuilder: (request) {
        return request.uri.toString();
      },
    );

    _dio = Dio(options);

    _dio.interceptors.add(
      DioCacheInterceptor(
        options: cacheOptions ?? defaultCacheOptions,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          var authorization = _getAuthorizationHeader();
          if (authorization != null) {
            options.headers.addAll(authorization);
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          ErrorEntity errorEntity = createErrorEntity(e);
          handler.reject(DioException(
            requestOptions: e.requestOptions,
            error: errorEntity.message,
            type: e.type,
            response: e.response,
          ));
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            error: true,
            requestHeader: false,
            responseHeader: false,
            request: false,
            requestBody: false),
      );
    }
  }

  JsonMap? _getAuthorizationHeader() {
    final userService = Get.find<UserService>();
    String? accessToken = userService.apiToken;
    if (accessToken != null) {
      return {'Authorization': 'Bearer $accessToken'};
    }
    return null;
  }

  Future post(
    String url, {
    data,
    JsonMap? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    var response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
    return response.data;
  }

  Future get(
    String url, {
    JsonMap? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }

  Future delete(
    String url, {
    data,
    JsonMap? queryParameters,
    Options? options,
  }) async {
    var response = await _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }
}
