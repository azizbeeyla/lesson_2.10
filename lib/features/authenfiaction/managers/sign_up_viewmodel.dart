import 'package:flutter/material.dart';
import '../../../data/models/authefincation_models/sign_up.dart';
import '../../../data/repositry/sign_up_repostriy.dart';
import '../../../data/result.dart';

class SignUpViewModel extends ChangeNotifier {
  final SignUpRepository repository = SignUpRepository();

  bool isLoading = false;
  String? error;
  bool success = false;

  Future<void> register(SignUpModel model) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();

    final result = await repository.register(model);

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
