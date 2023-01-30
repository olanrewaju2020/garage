import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../misc/constants.dart';
import '../misc/enum.dart';
import '../misc/utils.dart';
import 'api_response.dart';

class RestService {
  // String baseUrl = 'https://garag.pmcsolutions.co/';
  // String baseUrl = 'http://208.87.133.54:4000/';
  String baseUrl = 'http://10.0.2.2:3003/';
  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };


  Future<ApiResponse> method(
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
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
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
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
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
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  ApiResponse(
                message: decode['data'],
                isSuccessful:  false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  null,
                error: decode['data'],
                path: url
            );
          }
        default:
          response = await client
              .get(Uri.parse('$baseUrl$url'), headers: _headers)
              .timeout(const Duration(seconds: timeOutSeconds));
          final decode = json.decode(response.body);
          if (response.statusCode == 200) {
            return ApiResponse.fromJson(decode);
          } else {
            ShowToast(msg: decode['data'], type: ErrorType.error);
            return  ApiResponse(
                message: "${decode['data']}",
                isSuccessful: false,
                hasError: true,
                data: null,
                timestamp: DateTime.now(),
                status:  "${response.statusCode}",
                error: "${decode['data']}",
                path: url
            );
          }
      }
    } on FormatException catch (e) {
      ShowToast(msg: '$e', type: ErrorType.error);
      return  ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Format Exception: $e",
          path: url
      );
    } on TimeoutException catch (e) {
      ShowToast(msg: '$e', type: ErrorType.error);
      return  ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Timeout Exception: $e",
          path: url
      );
    } on SocketException catch (e) {
      ShowToast(msg: '$e', type: ErrorType.error);
      return  ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Socket Exception: $e",
          path: url
      );
    } on Exception catch (e) {
      ShowToast(msg: '$e', type: ErrorType.error);
      return  ApiResponse(
          message: "$e",
          isSuccessful:  false,
          data: null,
          timestamp: DateTime.now(),
          status:  null,
          hasError: true,
          error: "Exception: $e",
          path: url
      );
    } finally {
      client.close();
    }
  }
}
