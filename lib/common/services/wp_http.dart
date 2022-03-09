import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

import '../models/index.dart';
import '../routers/index.dart';
import '../utils/index.dart';
import '../values/index.dart';
import 'index.dart';

class WPHttpService extends GetxService {
  static WPHttpService get to => Get.find();

  late final Dio _dio;
  final CancelToken _cancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();

    var options = BaseOptions(
      baseUrl: Constants.wpApiBaseUrl,
      connectTimeout: 10000, // 10秒
      receiveTimeout: 5000, // 5秒
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio = Dio(options);

    _dio.interceptors.add(RequestInterceptors());
  }

  Map<String, dynamic>? getHeaders() {
    var headers = <String, dynamic>{};
    if (Get.isRegistered<UserService>() && UserService.to.hasToken) {
      headers['Authorization'] = 'Bearer ${UserService.to.token}';
    }
    return headers;
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = getHeaders();
    var response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  Future<dynamic> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    requestOptions.headers = getHeaders();
    var response = await _dio.post(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  Future<dynamic> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    requestOptions.headers = getHeaders();
    var response = await _dio.put(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  Future<dynamic> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    requestOptions.headers = getHeaders();
    var response = await _dio.delete(
      url,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }
}

class RequestInterceptors extends Interceptor {
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   super.onRequest(options, handler);
  //   // return handler.next(options);
  //   // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
  //   // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
  //   //
  //   // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
  //   // 这样请求将被中止并触发异常，上层catchError会被调用。
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.response,
        ),
        true,
      );
    } else {
      handler.next(response);
      // super.onResponse(response, handler);
    }
    // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('http error type -----------');
      print(err.response);
      print('http error type -----------');
    }

    final exception = HttpException(err.message);
    switch (err.type) {
      case DioErrorType.response: // 服务端自定义错误体处理
        final response = err.response;
        WpRes res = WpRes.fromJson(response?.data);
        Loading.error(res.message ?? 'Unknown error');
        switch (res.code) {
          case "401":
            _errorNoAuthLogout();
            break;
        }
        break;
      case DioErrorType.other:
        Loading.error('Network connection failed');
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectTimeout:
        Loading.error('Network request timed out');
        break;
      default:
        Loading.error('Unknown error');
        break;
    }
    err.error = exception;
    handler.next(err);
    // super.onError(err, handler);
    // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
  }

  Future<void> _errorNoAuthLogout() async {
    await UserService.to.logout();
    Get.offAndToNamed(RouteNames.login);
  }
}
