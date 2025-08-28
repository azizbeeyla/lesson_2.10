import 'package:flutter/cupertino.dart';

import '../../../data/models/me/me_model.dart';
import '../../../data/repositry/me_repositriy.dart';

class MeViewModel extends ChangeNotifier {
  final MeRepositiry _repository;

  MeViewModel({required MeRepositiry repository}) : _repository = repository {
    fetchMe();
  }

  MeModel? me;
  bool loading = false;
  String? errorMessage;

  Future<void> fetchMe() async {
    loading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getMe();
    result.fold(
          (err) => errorMessage = err.toString(),
          (data) => me = data,
    );

    loading = false;
    notifyListeners();
  }
}

