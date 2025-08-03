import 'package:flutter/material.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';

class RegisterView extends ChangeNotifier {
  bool isLoading = false;

  Future<void> registerUser({
    required String fullName,
    required String email,
    required String mobile,
    required String birthdate,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    final username = fullName.trim().split(' ');
    final firstName = username.isNotEmpty ? username.first : '';
    final lastName = username.length > 1 ? username.sublist(1).join(' ') : '';

    var response = await dio.post(
      '/auth/register',
      data: {
        "username": fullName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": mobile,
        "birthDate": birthdate,
        "password": password,
        "cookingLevelId": null,
      },
    );

    isLoading = false;
    notifyListeners();

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Ro‘yxatdan o‘tishda xatolik: ${response.data}');
    }
  }}
