import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../misc/constants.dart';
import '../misc/enum.dart';
import '../misc/utils.dart';
import 'api_response.dart';

class RestService {
  String baseUrl = 'http://10.0.2.2:3003/';
  // String baseUrl = 'https://garag.pmcsolutions.co/';
  // String baseUrl = 'http://208.87.133.54:4000/';
  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  ApiResponse _apiResponse =  ApiResponse(data: null);

  Future<ApiResponse> httpMethod(
      {required String method, required String url, Map? body}) async {
    final client = http.Client();
    http.Response response;
    try {
      switch (method) {
        case 'delete':
          response = await client.delete(
            Uri.parse('$baseUrl$url'),
            headers: _headers,
            body: json.encode(body),
          )
              .timeout(const Duration(seconds: timeOutSeconds));
          final decode = json.decode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            return ApiResponse.fromJson(decode);
          }
          else {
            _apiResponse = ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  _apiResponse;
          }
        case 'PUT':
          response = await client
              .put(
            Uri.parse('$baseUrl$url'),
            headers: _headers,
            body: json.encode(body),
          )
              .timeout(const Duration(seconds: timeOutSeconds));
          final decode = json.decode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            return ApiResponse.fromJson(decode);
          }
          else {
            _apiResponse = ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  _apiResponse;
          }
        case 'POST':
          response = await client
              .post(
            Uri.parse('$baseUrl$url'),
            headers: _headers,
            body: json.encode(body),
          )
              .timeout(const Duration(seconds: timeOutSeconds));
          final decode = json.decode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            return ApiResponse.fromJson(decode);
          }
          else {
            _apiResponse = ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  _apiResponse;
          }
        default:
          response = await client
              .get(Uri.parse('$baseUrl$url'), headers: _headers)
              .timeout(const Duration(seconds: timeOutSeconds));
          final decode = json.decode(response.body);
          if (response.statusCode == 200) {
            return ApiResponse.fromJson(decode);
          } else {
            _apiResponse = ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  _apiResponse;
          }
      }
    } on FormatException catch (e) {
       _apiResponse= ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Format Exception: $e",
          path: url
      );
       Logger().d(e);
      ShowToast(msg: '$e', type: ErrorType.error);
      return _apiResponse;
    } on TimeoutException catch (e) {
      _apiResponse= ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Format Exception: $e",
          path: url
      );
      ShowToast(msg: '$e', type: ErrorType.error);
      Logger().e(e);
      return _apiResponse;
    } on SocketException catch (e) {
      _apiResponse= ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Format Exception: $e",
          path: url
      );
      ShowToast(msg: '$e', type: ErrorType.error);
      Logger().e(e);
      return _apiResponse;
    } on Exception catch (e) {
      _apiResponse= ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Format Exception: $e",
          path: url
      );
      ShowToast(msg: '$e', type: ErrorType.error);
      Logger().e(_apiResponse);
      return _apiResponse;
    } finally {
      client.close();
    }
  }
}
