import 'package:lesson2_10/data/result.dart';
import '../../core/clients/dio_cielent.dart';
import '../models/authefincation_models/sign_up.dart';

class SignUpRepository {
  final ApiClient apiClient;

  SignUpRepository({required this.apiClient});

  Future<Result<Map<String, dynamic>>> register(SignUpModel model) async {
    final result = await apiClient.post(
      "/auth/register",
      data: model.toJson(),
    );

    return result.fold(
          (err) => Result.error(err),
          (data) {
        if (data is Map<String, dynamic>) {
          return Result.ok(data);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
