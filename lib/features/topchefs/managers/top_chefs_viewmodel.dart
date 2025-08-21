import 'package:flutter/material.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/topchefs/topchefs.dart';

import '../../../data/repositry/topchefs/top_chefs.dart';

class TopChefsViewModel extends ChangeNotifier {
  final TopChefsRepository _chefsRepo;
  final ApiClient _apiClient;

  bool isLoading = false;
  String? error;

  List<TopChefsModel> chefsOne = [];
  List<TopChefsModel> chefsTwo = [];
  List<TopChefsModel> chefsThree = [];

  TopChefsViewModel({
    required ApiClient apiClient,
    required TopChefsRepository chefsRepo,
  })  : _chefsRepo = chefsRepo,
        _apiClient = apiClient;

  Future<void> fetchTopChefs({int limit = 5, int page = 1}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await _chefsRepo.getTopChefs(limit: limit, page: page);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        if (page == 1) {
          chefsOne = data;
        } else if (page == 2) {
          chefsTwo = data;
        } else if (page == 3) {
          chefsThree = data;
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
