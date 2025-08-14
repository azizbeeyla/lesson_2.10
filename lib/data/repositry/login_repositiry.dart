import 'package:lesson2_10/data/result.dart';
import '../../core/clients/dio_cielent.dart';
import '../models/authefincation_models/login_model.dart';

class AuthRepository {
  final ApiClient apiClient = ApiClient();

  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    print("keldi${model}");
    final result = await apiClient.post(
      "/auth/login",
      data: model.toJson(),
    );

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          if (data["accessToken"] != null && data["accessToken"].toString().isNotEmpty) {
            return Result.ok(data);
          } else {
            return Result.error(Exception("Token kelmadi"));
          }
        }
        return Result.error(Exception("Xato"));
      },
    );
  }
}
