import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:sla_common/data/urls.dart';
import 'package:sla_common/models/models.dart';
import 'package:sla_logger/sla_logger.dart';

/// http methods
enum Method { POST, GET, PUT, DELETE, PATCH }

/// api client class
/// used to make http request
class ApiClient {
  static final _log = AppLog(ApiClient);

  /// native http client

  /// unsecured header
  static const Map<String, String> header = {
    "x-api-key": xApiKey,
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  /// make an http request
  Future<dynamic> request({
    required String url,
    required dynamic body,
    method = Method.POST,
  }) async {
    const tag = "request";
    final client = http.Client();
    try {
      /// http response holder
      http.Response? response;

      /// add base url
      final uri = Uri.parse(url);

      /// convert body to string
      final _body = json.encode(body);

      /// make the request based on method
      switch (method) {
        case Method.GET:
          response = await client.get(uri, headers: header);
          break;
        case Method.POST:
          response = await client.post(uri, headers: header, body: _body);
          break;
        case Method.PUT:
          response = await client.put(uri, headers: header, body: _body);
          break;
        case Method.DELETE:
          response = await client.delete(uri, headers: header, body: _body);
          break;
        case Method.PATCH:
          response = await client.patch(uri, headers: header, body: _body);
          break;
        default:
          response = await client.get(uri, headers: header);
          break;
      }

      /// print on console
      _showData(
        url: url,
        response: response.body,
        body: _body,
        method: method,
        header: header,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401 ||
          response.statusCode == 404 ||
          response.statusCode == 422 ||
          response.statusCode == 400) {
        var data = json.decode(response.body);
        client.close();
        if (data != null) {
          _log.s(
            tag,
            "------- [${url.split("/").lastOrNull}] [${response.statusCode}] : ${response.body}",
          );
          return Future.value(data);
        }
        _log.e(
          tag,
          "------- [${url.split("/").lastOrNull}] [${response.statusCode}] failed",
          response,
        );
        throw AppException("request failed");
      } else {
        _log.e(tag, "------- [${url.split("/").lastOrNull}] [${response.statusCode}] server error",
            response);
        throw AppException("Server Error");
      }
    } on TimeoutException catch (e) {
      _log.e(tag, "request timeout", e);
      throw AppException("Weak Connection");
    } on SocketException catch (e) {
      _log.e(tag, "socket broken", e);
      throw AppException("No Internet");
    } on Error catch (e) {
      _log.e(tag, "catch error", e);
      throw AppException("Error Occurred");
    }
  }

  /// print on console
  static void _showData({
    required String url,
    dynamic body,
    required Map<String, dynamic> header,
    required String response,
    required Method method,
  }) {
    const tag = "_showData";
    try {
      if (kDebugMode) {
        print('URL = $url');
        print('BODY = $body');
        print('HEADER = $header');
        print('METHOD = $method');
        print('RESPONSE = $response');
      }
    } catch (e) {
      _log.e(tag, "print on console failed", e);
    }
  }
}
