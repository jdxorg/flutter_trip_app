import 'dart:io';
import 'dart:collection';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter_trip_app/common/constraints/sys_config.dart';
import './interceptors.dart';
import './code.dart';
import './result_data.dart';
/*
 * 封装 restful 请求
 */
class HttpUtils {
  /// global dio object
  static Dio dio;
  /// request method
  static Future<ResultData> request(url,{data,queryParameters,header, method='GET', bool noTip=false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }
    Options options = new Options(method:method,headers:headers);
    /// query 参数处理
    if( queryParameters!=null ){
      url = url.indexOf('?')!=-1?(url+queryParameters):('$url?$queryParameters');
    }
    /// restful 请求处理 gysw/search/hist/:user_id => /gysw/search/hist/27
    if( data !=null ){
      data.forEach((key, value) {
        if (url.indexOf(key) != -1) {
          url = url.replaceAll(':$key', value.toString());
        }
      });
    }
    Dio dio = createInstance();
    Response response;

    try {
      response = await dio.request(url,data: data, options:options );
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }
    return response.data;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
        baseUrl: SysConfig.BASE_URL,
        connectTimeout: SysConfig.CONNECT_TIMEOUT,
        receiveTimeout: SysConfig.RECEIVE_TIMEOUT,
        contentType: ContentType.parse(SysConfig.CONTENT_TYPE_FOR_FORM),
      );
      dio = new Dio(options);
      // Add request interceptor
      dio.interceptors.add(CustomInterceptors(dio));
      // dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
