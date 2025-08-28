import 'package:flutter/material.dart';
import '../../../data/models/authefincation_models/login_model.dart';
import '../../../data/repositry/login_repositiry.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;

  bool isLoading = false;
  String? error;
  String? token;

  LoginViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;

  Future<bool> login(String login, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    bool success = false;

    try {
      final result = await _authRepo.login(LoginModel(login: login, password: password));

      result.fold(
            (e) {
          error = e.toString();
          success = false;
        },
            (data) {
          success = true;
        },
      );
    } catch (e) {
      error = e.toString();
      success = false;
    }

    isLoading = false;
    notifyListeners();

    return success;
  }
}
