import 'package:dio/dio.dart';
import 'package:km_test_suitmedia_resmaadi/config/env.dart';

import '../../shared/models/response_model.dart';

/// Risen Core API
/// Createf by : Resma Adi Nugroho @reezcode
/// This class is used to call API from Risen Core
class RsAPI {
  RsAPI._();

  static final instance = RsAPI._();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json));

  /// GET METHOD
  /// Get list of data from API with return data type list<dynamic>
  Future<ResponseModel> list(
      {required String endpoint,
      Map<String, dynamic>? data,
      String? token,
      String? page,
      String? limit,
      Map<String, dynamic>? otherOptions,
      Map<String, dynamic>? extraParam,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final res = await _dio.get(endpoint,
          options: Options(
            headers: {
              'authorization': token,
              if (otherOptions != null) ...otherOptions
            },
            contentType: 'application/json',
          ),
          queryParameters: {'page': page, 'limit': limit, ...extraParam!},
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ResponseModel.fromJson(res.data['data']);
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  /// Get detail data from API with return data type Map<String, dynamic>
  /// [id] is required
  Future<ResponseModel> show(
      {required String endpoint,
      Map<String, dynamic>? data,
      String? token,
      String? id,
      Map<String, dynamic>? otherOptions,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final res = await _dio.get('$endpoint/$id/show',
          options: Options(
            headers: {
              'authorization': token,
              if (otherOptions != null) ...otherOptions
            },
            contentType: 'application/json',
          ),
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ResponseModel.fromJson(res.data);
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  /// Normal get data from API with return data type Map<String, dynamic>
  Future<ResponseModel> get<T>(
      {required String endpoint,
      Map<String, dynamic>? data,
      String? token,
      Map<String, dynamic>? otherOptions,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final res = await _dio.get(endpoint,
          options: Options(
            headers: {
              'authorization': token,
              if (otherOptions != null) ...otherOptions
            },
            contentType: 'application/json',
          ),
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data);
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ResponseModel.fromJson(res.data);
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }
}
