import 'package:flutter/material.dart';
import '../../../data/models/categorymodels/sourse_model.dart';
import '../../../data/repositry/sourse_repository.dart';

class CategoryView extends ChangeNotifier {
  final CategoryRepository _repository;
  bool _disposed = false;

  CategoryView({required CategoryRepository repository})
      : _repository = repository {
    _loadCachedCategories();
    getCategories();
  }

  List<SourseModel> categories = [];
  bool isLoading = false;
  String? error;

  void _loadCachedCategories() {
    categories = _repository.getCachedCategories();
    notifyListeners();
  }

  Future<void> getCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      categories = await _repository.fetchCategories();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
