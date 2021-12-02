import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:expiret/config/error/exceptions.dart';
import 'package:expiret/services/local_storage.dart';
import 'package:expiret/services/base_service.dart';

class DataService extends BaseService {
  @override
  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      var uri = Uri.parse(baseUrl + url);
      var token = Storage().token;
      var response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 40));
      return getResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  Map<String, dynamic> getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 403:
        throw UnautherizedException(response.statusCode);
      case 404:
        throw NotFoundException(response.statusCode);
      case 500:
        throw FetchDataException(response.statusCode);
      default:
        throw InternetConnectionException();
    }
  }
}
