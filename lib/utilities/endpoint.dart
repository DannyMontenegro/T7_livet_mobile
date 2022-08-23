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

  final String productionUrl =
      'http://livetapiflask-env.eba-jqjrkzgw.us-east-1.elasticbeanstalk.com/';

  Endpoint._sharedInstance() {
    baseUrl = productionUrl;
  }

  static final Endpoint _instance = Endpoint._sharedInstance();

  factory Endpoint() => _instance;

  final Dio _dio = Dio();

  Future<dynamic> getData(String path) async {
    final String url = _getUrl(path);
    final Response response = await _dio.get(url);
    return response.data;
  }

  Future<dynamic> postData(String path, Map<String, String> body) async {
    final String url = _getUrl(path);
    final response = await _dio.post(url, data: body);
    return getBody(response);
  }

  dynamic getBody(Response response) => json.decode(response.data);

  String _getUrl(String path) => '$baseUrl/$path';
}
