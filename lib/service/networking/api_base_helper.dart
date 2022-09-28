import 'dart:convert';
import 'app_exception.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = 'https://quizu.okoul.com/';
  String authorization = "";
  Map<String, String> headers = {"Authorization": ""};

  Future<dynamic> get(String url, {String authorization = " "}) async {
    headers['authorization'] = authorization;
    Uri uri = Uri.parse(_baseUrl + url);
    dynamic responseJson;
    try {
      dynamic response = await http.get(uri, headers: headers);
      responseJson = _returnResponse(response);
    } catch (_) {}
    return responseJson;
  }

  Future<dynamic> get2(String url, {String authorization = " "}) async {
    headers['authorization'] = authorization;
    Uri uri = Uri.parse(_baseUrl + url);
    dynamic response;
    try {
      response = await http.get(uri, headers: headers);
    } catch (_) {}
    return response;
  }

  Future<dynamic> post(
    String url,
    Map<String, dynamic> body,
  ) async {
    Uri uri = Uri.parse(_baseUrl + url);
    dynamic response;
    try {
      response = await http.post(uri, body: body, headers: headers);
    } catch (_) {}
    return response;
  }

  Future<int> post2(String url, Map<String, dynamic> body,
      {String authorization = " "}) async {
    headers['authorization'] = authorization;
    Uri uri = Uri.parse(_baseUrl + url);
    dynamic response;
    try {
      response = await http.post(uri, body: body, headers: headers);
    } catch (_) {}
    return response.statusCode;
  }

  Future<int> get3(String url, {String authorization = " "}) async {
    headers['authorization'] = authorization;
    Uri uri = Uri.parse(_baseUrl + url);
    dynamic response;
    try {
      response = await http.get(uri, headers: headers);
    } catch (_) {}
    return response.statusCode;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
