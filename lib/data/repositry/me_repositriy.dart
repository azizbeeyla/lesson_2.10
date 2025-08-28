import 'package:lesson2_10/data/models/me/me_model.dart';
import 'package:lesson2_10/data/result.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';

class MeRepositiry {
  final ApiClient _apiClient;

  MeRepositiry({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<MeModel>> getMe() async {
    final result = await _apiClient.get("/auth/me");

    return result.fold(
          (err) => Result.error(err),
          (data) {
        try {
          if (data is Map<String, dynamic>) {
            final detail = MeModel.fromJson(data);
            return Result.ok(detail);
          }
          else if (data is List && data.isNotEmpty && data[0] is Map<String, dynamic>) {
            final detail = MeModel.fromJson(data[0]);
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
