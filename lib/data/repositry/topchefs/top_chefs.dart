import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/result.dart';
import '../../models/topchefs/topchefs.dart';

class TopChefsRepository {
  final ApiClient _apiClient;

  TopChefsRepository({required ApiClient apiClient}):_apiClient=apiClient;

  Future<Result<List<TopChefsModel>>> getTopChefs({
    required int limit,
    required int page,
  }) async {
    final result = await _apiClient.get("/top-chefs/list?Page=$page&Limit=$limit");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        try {
          if (data is List) {
            final chefs = data
                .map((item) => TopChefsModel.fromJson(item as Map<String, dynamic>))
                .toList();
            return Result.ok(chefs);
          } else {
            return Result.error(Exception("Noto‘g‘ri format: List emas"));
          }
        } catch (e) {
          return Result.error(Exception(e.toString()));
        }
      },
    );
  }
}
