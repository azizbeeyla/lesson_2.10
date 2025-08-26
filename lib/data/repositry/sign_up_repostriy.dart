import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lesson2_10/data/result.dart';
import '../../core/clients/dio_cielent.dart';
import '../models/authefincation_models/sign_up.dart';

class SignUpRepository {
  final ApiClient apiClient;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

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
          final token = data['accessToken'];
          if (token != null) {
            _secureStorage.write(key: "token", value: token);
          }
          return Result.ok(data);
        }
        return Result.error(Exception("Xato javob formati"));
      },
    );
  }
}
