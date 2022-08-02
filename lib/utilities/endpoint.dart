import 'dart:convert';

import 'package:dio/dio.dart';

class Endpoint {
  Endpoint._sharedInstance();

  static final Endpoint instance = Endpoint._sharedInstance();

  final Dio _dio = Dio();

  Future<dynamic> getData(String url) async {
    final Response response = await _dio.get(url);
    return getBody(response);
  }

  Future<dynamic> postData(String url, String body) async {
    final response = await _dio.get(url);
    return getBody(response);
  }

  dynamic getBody(Response response) => json.decode(response.data);
}
