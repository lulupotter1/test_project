import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_project/utils/constants.dart';

class PreloaderApi {
  final baseUrl = Constants.baseUrl;

  var _dio = Dio();

  Future<String?> getRedirectUrl() async {
    final response = await _dio.get(baseUrl,
        options: Options(
          followRedirects: true,
        ));
    for (var i = 0; i < response.redirects.length; i++) {}
    if (response.redirects.first.location.toString().contains("google")) return null;

    return response.data;
  }
}
