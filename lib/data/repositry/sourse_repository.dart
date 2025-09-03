import 'package:hive/hive.dart';
import '../../../core/clients/dio_cielent.dart';
import '../../../data/models/categorymodels/sourse_model.dart';

class CategoryRepository {
  final ApiClient _apiClient;
  final Box<SourseModel> _box = Hive.box<SourseModel>('categories');

  CategoryRepository({required ApiClient apiClient}) : _apiClient = apiClient;


  Future<List<SourseModel>> fetchCategories() async {
    final result = await _apiClient.get<dynamic>("/admin/categories/list");

    return result.fold(
          (e) => throw Exception("API xatosi: $e"),
          (data) {
        try {
          final categories = (data as List)
              .map((x) => SourseModel.fromJson(x))
              .toList();
          _saveToHive(categories);
          return categories;
        } catch (e) {
          throw Exception("JSON parse xatosi: $e");
        }
      },
    );
  }

  Future<void> _saveToHive(List<SourseModel> list) async {
    await _box.clear();
    for (var item in list) {
      await _box.put(item.id, item);
    }
  }

  List<SourseModel> getCachedCategories() {
    return _box.values.toList();
  }
}
