import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:expiret/config/error/exceptions.dart';
import 'package:expiret/services/local_storage.dart';
import 'package:expiret/services/rest_api_service.dart';

class DataService extends RestApiService {
  @override
  Future<dynamic> getRequest(String url) async {
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
      return returnResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  @override
  Future<dynamic> postRequest(String url, Map<String, dynamic> body) async {
    try {
      var uri = Uri.parse(baseUrl + url);
      var token = Storage().token;
      var response = await http.post(
        uri,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 40));
      return returnResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  @override
  Future<dynamic> deleteRequest(String url, Map<String, dynamic> body) async {
    try {
      var uri = Uri.parse(baseUrl + url);
      var token = Storage().token;
      var response = await http.delete(
        uri,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 40));
      return returnResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  @override
  Future<dynamic> putRequest(String url, Map<String, dynamic> body) async {
    try {
      var uri = Uri.parse(baseUrl + url);
      var token = Storage().token;
      var response = await http.put(
        uri,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 40));
      return returnResponse(response);
    } on SocketException {
      throw InternetConnectionException();
    } on TimeoutException {
      throw WeakInternetConnection();
    }
  }

  dynamic returnResponse(http.Response response) {
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
