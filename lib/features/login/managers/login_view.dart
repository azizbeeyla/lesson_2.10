import 'package:flutter/material.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';

class LoginView extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  Future<String?> login(String login, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'login': login,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return response.data['accessToken'];
      } else {
        error = 'Login failed';
      }
    } catch (e) {
      error = 'Login error: ${e.toString()}';
    }

    isLoading = false;
    notifyListeners();
    return null;
  }
}
