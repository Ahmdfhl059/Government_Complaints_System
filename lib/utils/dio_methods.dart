import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'constants.dart';
import 'headers.dart';
import 'secure_storage.dart';

class RemoteApi {
  static final Dio _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        headers: headersWithContent,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
      ),
    )
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

  // Helper method to check response status
  static void _checkResponseStatus(int? statusCode) {
    if (statusCode != null && (statusCode < 200 || statusCode >= 300)) {
      throw Exception('Request failed with status code: $statusCode');
    }
  }

  // Helper method to make requests
  static Future<Response> _makeRequest(
      String method,
      String url, {
        dynamic body,
        Map<String, String>? headers,
      }) async {
    try {
      var token =await SecureStorage.getToken();
      final response = await _dio.request(
        url,
        data: body,
        options: Options(
          method: method,
          headers: headers ?? headersWithAuth( token),
        ),
      );
      _checkResponseStatus(response.statusCode);
      return response;
    } on DioException catch (dioException) {
      print('Dio Error: ${dioException.message}');
      if (dioException.response != null) {
        print('Response data: ${dioException.response?.data}');
        print('Response status: ${dioException.response?.statusCode}');
      }
      rethrow;
    } catch (error) {
      print('Unexpected Error: $error');
      rethrow;
    }
  }

  // POST request
  static Future<Response> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    print("headers in the request :$headers");
    return _makeRequest('POST', url, body: body, headers: headers);
  }

  // GET request
  static Future<Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    return _makeRequest('GET', url, headers: headers);
  }

  // DELETE request
  static Future<Response> delete(
    String url, {
    Map<String, String>? headers,
  }) async {
    return _makeRequest('DELETE', url, headers: headers);
  }

  // Helper method to create MultipartFile
  static Future<MultipartFile?> _createMultipartFile(
    XFile? filePath,
    String? fileName,
  ) async {
    if (filePath == null) return null;
    return await MultipartFile.fromFile(filePath.path, filename: fileName);
  }

  // POST request with file upload
  static Future<Response> postWithFile({
    required String url,
    required String token,
    required Map<String, String> fields,
    XFile? filePath,
    String? filesKey,
  }) async {
    final fileName = filePath?.path;
    final file = await _createMultipartFile(filePath, fileName);

    final formData = FormData.fromMap({...fields,if(file!=null) filesKey ?? 'image': file});
    return _makeRequest(
      'POST',
      url,
      body: formData,
      headers: headersWithAuth(token),
    );
  }

  static dynamic decodeResponse(Response response) {
    if (response.data is String) {
      return json.decode(response.data as String);
    }
    return response.data;
  }
}
