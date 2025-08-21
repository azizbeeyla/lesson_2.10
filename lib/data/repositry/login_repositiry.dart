import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lesson2_10/data/result.dart';
import '../../core/clients/dio_cielent.dart';
import '../models/authefincation_models/login_model.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage;

  AuthRepository({
    required ApiClient apiClient,
    required FlutterSecureStorage secureStorage,
  }) : _apiClient = apiClient,
       _secureStorage = secureStorage;

  Future<Result<Map<String, dynamic>>> login(LoginModel model) async {
    final result = await _apiClient.post(
      "/auth/login",
      data: model.toJson(),
    );

    return result.fold((error) => Result.error(error), (value) {
      _secureStorage.write(key: "token", value: value['accessToken']);
      _secureStorage.write(key: "login", value: value[model.login]);
      _secureStorage.write(key: "password", value: value[model.password]);
      return Result.ok(value['accessToken']);
    });
  }
}
