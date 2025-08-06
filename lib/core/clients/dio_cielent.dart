import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.8.185:8888/api/v1",
    validateStatus: (status) => true,
  ),
);