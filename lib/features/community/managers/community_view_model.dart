import 'package:flutter/material.dart';

import '../../../data/models/comunity_models/comunity_model.dart';
import '../../../data/repositry/community_repostriy.dart';

class CommunityViewModel extends ChangeNotifier {
  CommunityViewModel({required CommunityRepository communityRepo})
      : _communityRepo = communityRepo {
    fetchCommunityTop();
    fetchCommunityNew();
    fetchCommunityOld();
  }

  final CommunityRepository _communityRepo;

  List<CommunityModel> communityTop = [],
      communityNew = [],
      communityOld = [];
  bool isLoadingTop = true;
  bool isLoadingNew = true;

  bool isLoadingOld = true;
  String? error;

  Future<void> fetchCommunityTop() async {
    isLoadingTop = true;
    notifyListeners();
    var result = await _communityRepo.getAll({"Limit": 4});

    result.fold(
          (err) {
        error = err.toString();
      },
          (value) {
        communityTop = value;
      },
    );

    isLoadingTop = false;
    notifyListeners();
  }

  Future<void> fetchCommunityNew() async {
    isLoadingNew = true;
    notifyListeners();
    var result = await _communityRepo.getAll({
      "Limit": 14,
      "Order": "Rating",
      "Descending": "true",
    });

    result.fold(
          (err) {
        error = err.toString();
      },
          (value) {
        communityNew = value;
      },
    );

    isLoadingNew = false;
    notifyListeners();
  }

  Future<void> fetchCommunityOld() async {
    isLoadingOld = true;
    notifyListeners();
    var result = await _communityRepo.getAll({
      "Limit": 8,
      "Order": "Rating",
      "Descending": "false",
    });

    result.fold(
          (err) {
        error = err.toString();
      },
          (value) {
        communityOld = value;
      },
    );

    isLoadingOld = false;
    notifyListeners();
  }
}