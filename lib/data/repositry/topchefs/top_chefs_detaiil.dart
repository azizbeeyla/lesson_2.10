import 'package:lesson2_10/data/result.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';
import '../../models/topchefs/top_chefs_detail.dart';

class TopChefDetailRepository {
  final ApiClient _apiClient;

  TopChefDetailRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<TopChefsDetailModel>> getTopChefDetail(int id) async {
    final result = await _apiClient.get("/auth/details/$id");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        try {
          if (data is Map<String, dynamic>) {
            final detail = TopChefsDetailModel.fromJson(data);
            return Result.ok(detail);
          }
          else if (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>) {
            final detail = TopChefsDetailModel.fromJson(data[0]);
            return Result.ok(detail);
          } else {
            return Result.error(Exception("Noto‘g‘ri format: Map emas yoki bo‘sh List"));
          }
        } catch (e) {
          return Result.error(Exception(e.toString()));
        }
      },
    );
  }
}
