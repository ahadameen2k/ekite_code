import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:testing_class/data/network/BaseApiService.dart';
import 'package:testing_class/data/app_excaptions.dart';

class NetworkServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExcaption('NO INTERNET CONNECTION');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExcaption('NO INTERNET CONNECTION');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExcaption(response.body.toString());
      case 404:
        throw UnauthorisedExcaption(response.body.toString());
      default:
        throw FetchDataExcaption(
            'Error accured while Communication with server' +
                ' with status code' +
                response.statusCode.toString());
    }
  }
}
