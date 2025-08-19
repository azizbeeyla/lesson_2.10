import 'package:flutter/material.dart';
import '../../../data/models/authefincation_models/login_model.dart';
import '../../../data/repositry/login_repositiry.dart';
import '../../../data/result.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepo;

  bool isLoading = false;
  String? error;
  String? token;

  LoginViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;

  Future<bool> login(String login, String password) async {
    isLoading = true;
    error = null;
    bool success = false;

    notifyListeners();
    final result = await _authRepo.login(
      LoginModel(login: login, password: password),
    );

  return  result.fold((e) {


      error = e.toString();
      return false;
    }, (data) {

    success=true;
    return true;
  },
  );
    isLoading = false;
    notifyListeners();

    return success;
  }
}
