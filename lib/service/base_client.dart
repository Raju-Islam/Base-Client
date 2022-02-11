import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:base_client/app_constants/app_constants.dart';
import 'package:base_client/service/app_exception.dart';

class BaseClient {
  // Get
  Future<dynamic> get(String baseUrl, String api) async {
    final uri = Uri.parse(baseUrl + api);
    try {
      final response = await http
          .get(uri)
          .timeout(const Duration(seconds: AppConstants.timeOutDuration));

      return _proscessRespone(response);
    } on SocketException {
      throw FatchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responed in time', uri.toString());
    }
  }

  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    final uri = Uri.parse(baseUrl + api);
      var payload = json.encode(payloadObj);
    try {
      final response = await http
          .post(uri,body: payload)
          .timeout(const Duration(seconds: AppConstants.timeOutDuration));
      return _proscessRespone(response);
    } on SocketException {
      throw FatchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responed in time', uri.toString());
    }
  }

  // POST
  // DELETE
  // OTHER

  dynamic _proscessRespone(http.Response response) {
    switch (response.statusCode) {
      //success
      case 200:
        final responseJson =jsonDecode(response.body);
        return responseJson;
      // Bad Request response
      case 400:
        throw BadRequestException(
            jsonDecode(response.body), response.request.toString());
      // Unauthorized response
      case 401:
        throw BadRequestException(
            jsonDecode(response.body), response.request.toString());
      //server error response
      case 500:
      default:
        throw FatchDataException(
            'Error occourd with code :${response.statusCode}',
            response.request.toString());
    }
  }
}
