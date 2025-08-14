import 'package:flutter/material.dart';
import '../../../data/models/authefincation_models/sign_up.dart';
import '../../../data/repositry/sign_up_repostriy.dart';
import '../../../data/result.dart';

class SignUpViewModel extends ChangeNotifier {
final SignUpRepository _signupRepo;
  bool isLoading = false;
  String? error;
  bool success = false;

  SignUpViewModel({required SignUpRepository signupRepo}) : _signupRepo = signupRepo;

  Future<void> register(SignUpModel model) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();

    final result = await _signupRepo.register(model);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        success = true;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
