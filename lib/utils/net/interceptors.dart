import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import './code.dart';
import './token.dart';
import './result_data.dart';
import '../local/local_storage.dart';
import 'package:flutter_trip_app/common/constraints/sys_config.dart';
class CustomInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  String csrfToken;
  Dio tokenDio;
  CustomInterceptors(this._dio);
  @override
  onRequest(RequestOptions options) async {
    if (SysConfig.DEBUG) {
      print('请求地址：【' + options.method + '  ' + options.path + '】');
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    csrfToken = await Token.getAuthorization();
    if (csrfToken == null) {
      print("no token，request token firstly...");
      //lock the dio.
      _dio.lock();
      // new dio instance to request token
      if( tokenDio == null){
        tokenDio = new Dio();
        tokenDio.options = _dio.options;
      }
      return tokenDio.get("/token").then((d) async {
        if( d.data['token'] != null ){
          options.headers[SysConfig.TOKEN_KEY] = csrfToken = d.data['token'];
          await LocalStorage.save(SysConfig.TOKEN_KEY, csrfToken);
          print("request token succeed, value: " + d.data['token']);
          print('continue to perform request：path:${options.path}');
        }
      })
      .whenComplete(() async{
        // unlock the dio
        _dio.unlock();
        tokenDio=null;
        print('whenComplete');
      }); 
    } else {
      options.headers[SysConfig.TOKEN_KEY] = csrfToken;
    }
  }

  @override
  onResponse(Response response) {
    if (SysConfig.DEBUG) {
      print('响应数据: ' + response.data.toString());
    }
    RequestOptions option = response.request;
    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
  }

  @override
  onError(DioError error) async {
    if (SysConfig.DEBUG) {
      print('请求异常信息: ' + error.message);
    }
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", false), false, Code.NETWORK_ERROR));
    }
    // Assume 401 stands for token expired
    if( error.response?.statusCode == Code.EXPIRED ){
      RequestOptions options = error.response.request;
      if( csrfToken != options.headers[SysConfig.TOKEN_KEY]){
        options.headers[SysConfig.TOKEN_KEY] = csrfToken;
        //repeat
        return _dio.request(options.path, options: options);
      }
      // update token and repeat
      // Lock to block the incoming request until the token updated
      _dio.lock();
      _dio.interceptors.responseLock.lock();
      _dio.interceptors.errorLock.lock();
      if( tokenDio == null){
        tokenDio = new Dio();
        tokenDio.options = _dio.options;
      }
      return tokenDio.get("/token").then((d) async{
        //update csrfToken
        if( d.data['token'] != null ){
          options.headers[SysConfig.TOKEN_KEY] = csrfToken = d.data['token'];
          await LocalStorage.save(SysConfig.TOKEN_KEY, csrfToken);
        }
      }).whenComplete(() {
        _dio.unlock();
        _dio.interceptors.responseLock.unlock();
        _dio.interceptors.errorLock.unlock();
        tokenDio = null;
      }).then((e) {
        //repeat
        return _dio.request(options.path, options: options);
      });
    }
  }
}