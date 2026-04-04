import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _service = AuthService();

  bool isLoading = false;
  bool isLoggedIn = false;

  Future<bool> login(String aadhar, String password) async {
    isLoading = true;
    notifyListeners();

    final success = await _service.login(aadhar, password);

    isLoading = false;
    isLoggedIn = success;
    notifyListeners();

    return success;
  }

  Future<bool> signup(Map<String, dynamic> data) async {
    isLoading = true;
    notifyListeners();

    final success = await _service.signup(data);

    isLoading = false;
    notifyListeners();

    return success;
  }
}