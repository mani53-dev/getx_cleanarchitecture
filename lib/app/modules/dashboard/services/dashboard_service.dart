/* 
 * Author: Affine Sol (PVT LTD) - https://affinesol.com/ 
 * Last Modified: 19/12/2024 at 14:59:11
 */

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import '../../../providers/dio_client.dart';

abstract class AnyDashboardService {
  Future fetchData();
}

class DashboardService implements AnyDashboardService {
  static final CacheOptions cacheOptions = CacheOptions(
    store: MemCacheStore(),
    maxStale: const Duration(days: 1),
  );

  final DioClient _httpClient = DioClient(cacheOptions: cacheOptions);

  @override
  Future<List> fetchData() async {
    try {
      var response = await _httpClient.get(
        'your_api_endpoint',
      );
      //map the response in the model accordingly
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
