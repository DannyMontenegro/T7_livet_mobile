import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:livet_mobile/auth/keys.dart';

class Endpoint {
  late String baseUrl;

  /// This variable should be change on these two scenarios
  /// 1.- If you're using an android emulator the use this ip as localhost: 10.0.2.2
  /// 2.- If you're using a real device to run the app then use your own ip.
  /// Create a file in /lib/auth called keys.dart and create a variable called myIp;
  final String devUrl = myIp;

  final String productionUrl = '';

  Endpoint._sharedInstance() {
    baseUrl = devUrl;
  }

  static final Endpoint instance = Endpoint._sharedInstance();

  final Dio _dio = Dio();

  Future<dynamic> getData(String url) async {
    final Response response = await _dio.get(url);
    return getBody(response);
  }

  Future<dynamic> postData(String url, String body) async {
    final response = await _dio.post(url, data: body);
    return getBody(response);
  }

  dynamic getBody(Response response) => json.decode(response.data);
}
