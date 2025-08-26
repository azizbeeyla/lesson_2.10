import 'package:flutter/cupertino.dart';
import '../../../data/models/topchefs/top_chefs_detail.dart';
import '../../../data/repositry/topchefs/top_chefs_detaiil.dart';

class TopChefDetailViewModel extends ChangeNotifier {
  TopChefDetailViewModel({required TopChefDetailRepository repository, required int id})
      : _repository = repository {
    fetchTopChefDetail(id);
  }

  final TopChefDetailRepository _repository;

  TopChefsDetailModel? chefDetail;
  bool loading = false;
  String? errorMessage;

  Future<void> fetchTopChefDetail(int id) async {
    loading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await _repository.getTopChefDetail(id);
      result.fold(
            (err) => errorMessage = err.toString(),
            (data) => chefDetail = data,
      );
    } catch (e) {
      errorMessage = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
