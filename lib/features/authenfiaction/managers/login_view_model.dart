import 'package:flutter/material.dart';
import '../../../data/models/authefincation_models/login_model.dart';
import '../../../data/repositry/login_repositiry.dart';
import '../../../data/result.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository repository = AuthRepository();

  bool isLoading = false;
  String? error;
  String? token;

  Future<bool> login(String login, String password) async {
    isLoading = true;
    error = null;
    token = null;
    notifyListeners();
print("Login va Password${login}${password}");
    final result = await repository.login(
      LoginModel(login: login, password: password),
    );

    bool success = false;

    result.fold(
      (e) {
        error = "Xatolik: $e";
      },
      (data) {
        if (data["accessToken"] != null &&
            data["accessToken"].toString().isNotEmpty) {
          token = data["accessToken"];
          success = true;
        } else {
          error = "Token kelmadi";
        }
      },
    );

    isLoading = false;
    notifyListeners();

    return success;
  }
}
