import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firstapp_fiftychanllenge/app/constants.dart';
import 'package:firstapp_fiftychanllenge/data/pref/app_pref.dart';
import 'package:firstapp_fiftychanllenge/data/request/login_request.dart';
import 'package:firstapp_fiftychanllenge/data/response/responses.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_language.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = 'application/json';
const String CONNECT_TYPE = 'connect-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const String DEFAULT_LANGUAGE = 'language';

class AppServicesClient {
  late Dio dio;
  AppPrefrences _prefrences;

  AppServicesClient(this._prefrences) {
    String lang = _prefrences.getLangAppPref();
    Map<String, String> headers = {
      CONNECT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: lang
    };

    final options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 20 * 1000,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      receiveDataWhenStatusError: true,
      headers: headers,
    );
    dio = Dio(options);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    if (kReleaseMode) {
      print("in relrase mode");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
  }

  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    Response response =
        await dio.post(Constants.loginUrl, data: loginRequest.toJson());
    print("${response.statusMessage.toString()} status amr");
    AuthenticationResponse auth;
    if (response.statusMessage.toString() != "Not Found") {
      auth = AuthenticationResponse.fromJson(jsonDecode(response.data));
      print("${auth.status} status");
    } else {
      auth = AuthenticationResponse.NotFound();
      auth.status = 1;
      auth.message = "please register first";
    }
    return auth;
  }

  Future<ForgoPasswordResponse> forgotPass(String email) async {
    print("00000000000");
    Response response =
    await dio.post(Constants.forgotPasswordUrl, data: {"email":email});
    print("${response.statusMessage.toString()} status amr");
    ForgoPasswordResponse auth;
    if (response.statusMessage.toString() != "Not Found") {
      print("00000000000");
      auth = ForgoPasswordResponse.fromJson(jsonDecode(response.data));
    } else {
      print("111111111");
      auth = ForgoPasswordResponse.NotFound();
      auth.status = 1;
      auth.message = "error in send";
      auth.support = "this email dosent exist";
    }
    return auth;
  }

  Dio getDio() {
    return dio;
  }
}
