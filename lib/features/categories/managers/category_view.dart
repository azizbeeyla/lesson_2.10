import 'package:flutter/material.dart';
import '../../../data/models/categorymodels/sourse_model.dart';
import '../../../data/repositry/sourse_repository.dart';

class CategoryView extends ChangeNotifier {
  final CategoryRepository _repository;
  bool _disposed = false;

  CategoryView({required CategoryRepository repository})
      : _repository = repository {
    _init();
  }

  List<SourseModel> categories = [];
  bool isLoading = false;
  String? error;

  Future<void> _init() async {
    _loadCachedCategories();

    if (categories.isEmpty) {
      await getCategories();
    }
  }

  void _loadCachedCategories() {
    categories = _repository.getCachedCategories();
    debugPrint('Loaded ${categories.length} items from cache');
    notifyListeners();
  }

  Future<void> getCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      categories = await _repository.fetchCategories();
      debugPrint('Fetched ${categories.length} items from API');
    } catch (e) {
      error = e.toString();
      debugPrint('Error fetching categories: $error');
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
