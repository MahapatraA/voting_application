import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.7:3000';
  static String? token;

  Future<http.Response> get(String path, {bool auth = false}) {
    final headers = <String, String>{};

    if (auth && token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return http.get(Uri.parse('$baseUrl$path'), headers: headers);
  }

  Future<http.Response> post(String path, Map body, {bool auth = false}) {
    final headers = {'Content-Type': 'application/json'};

    if (auth && token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return http.post(
      Uri.parse('$baseUrl$path'),
      headers: headers,
      body: jsonEncode(body),
    );
  }
}