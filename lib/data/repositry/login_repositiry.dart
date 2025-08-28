import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/clients/dio_cielent.dart';
import '../models/authefincation_models/login_model.dart';
import '../result.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required ApiClient apiClient,
    required FlutterSecureStorage secureStorage,
  })  : _apiClient = apiClient,
        _secureStorage = secureStorage;

  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    final result = await _apiClient.post(
      "/auth/login",
      data: model.toJson(),

    );
    print("API response: $result");


    return result.fold(
          (error) => Result.error(error),
          (value) {
        _secureStorage.write(key: "token", value: value['accessToken']);
        _secureStorage.write(key: "login", value: model.login);
        _secureStorage.write(key: "password", value: model.password);

        return Result.ok(value['accessToken']);
      },
    );
  }
}
