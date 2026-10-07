import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_endpoints.dart';

class DioClient {
  static DioClient? _instance;
  late final Dio _dio;

  DioClient._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.defaultBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        followRedirects: false, // Disabling automatic redirect on POST allows catching 302 and redirecting via GET
        maxRedirects: 5,
        validateStatus: (status) => status != null && status < 400,
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: false, // Avoid cluttering console with huge sheets data
          requestHeader: false,
          responseHeader: false,
          error: true,
        ),
      );
    }
  }

  factory DioClient() => instance;
  static DioClient get instance => _instance ??= DioClient._();

  Dio get dio => _dio;

  Dio _createRedirectDio() {
    final client = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        followRedirects: true,
        maxRedirects: 5,
      ),
    );
    if (kDebugMode) {
      client.interceptors.add(
        LogInterceptor(
          requestBody: false,
          responseBody: false,
          error: true,
        ),
      );
    }
    return client;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    if (response.statusCode == 302 ||
        response.statusCode == 301 ||
        response.statusCode == 307) {
      final location = response.headers.value('location');
      if (location != null && location.isNotEmpty) {
        return _createRedirectDio().get<T>(
          location,
          options: Options(
            responseType: options?.responseType ?? ResponseType.json,
            headers: options?.headers,
            validateStatus: (status) => status != null && status < 500,
          ),
          cancelToken: cancelToken,
        );
      }
    }

    return response;
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    // Google Apps Script redirects (302) return Location header pointing to script.googleusercontent.com
    if (response.statusCode == 302 ||
        response.statusCode == 301 ||
        response.statusCode == 307) {
      final location = response.headers.value('location');
      if (location != null && location.isNotEmpty) {
        return _createRedirectDio().get<T>(
          location,
          options: Options(
            responseType: options?.responseType ?? ResponseType.json,
            headers: options?.headers,
            validateStatus: (status) => status != null && status < 500,
          ),
          cancelToken: cancelToken,
        );
      }
    }

    return response;
  }
}
