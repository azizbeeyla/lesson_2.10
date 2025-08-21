import 'package:flutter/material.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/topchefs/top_chefs_detail.dart';

import '../../../data/repositry/topchefs/top_chefs_detaiil.dart';

class TopChefDetailViewModel extends ChangeNotifier {
  final TopChefDetailRepository _detailRepo;
final ApiClient _apiClient;
  bool isLoading = false;
  String? error;
  TopChefsDetailModel? chefDetail;

  TopChefDetailViewModel({
    required ApiClient apiClient,required TopChefDetailRepository detailRepo ,
  }) : _apiClient=apiClient,_detailRepo=detailRepo;

  Future<void> fetchTopChefDetail(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await _detailRepo.getTopChefDetail(id);

    result.fold(
          (err) {
        error = err.toString();
      },
          (data) {
        chefDetail = data;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
