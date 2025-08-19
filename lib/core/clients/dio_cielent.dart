import 'package:dio/dio.dart';
import 'package:lesson2_10/data/result.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.9.6:8888/api/v1",
      validateStatus: (status) => true,
    ),
  );

  ApiClient();

  Future<Result<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      var response = await dio.get(
        path,
        queryParameters: queryParams,
      );
      print("📡 GET $path");
      print("👉 Status: ${response.statusCode}");
      print("👉 Data: ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data as T);
      }
      return Result.error(Exception(response.data));
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result> post(
      String path, {
        required Map<String, dynamic> data,
      }) async {
    try {
      var response = await dio.post(
        path,
        data: data,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data);
      } else {
        return Result.error(Exception(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
