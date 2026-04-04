import 'dart:convert';
import '../core/api_service.dart';

class AuthService {
  final ApiService _api = ApiService();

  Future<bool> login(String aadhar, String password) async {
    final res = await _api.post('/user/login', {
      "aadharId": int.parse(aadhar),
      "password": password,
    });
    
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      ApiService.token = data['token'];
      return true;
    }
    return false;
  }

  Future<bool> signup(Map<String, dynamic> data) async {
    final res = await _api.post('/user/signup', data);
    return res.statusCode == 201;
  }
}