import 'package:dio/dio.dart';
import 'package:lesson2_10/data/result.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.8.185:8888/api/v1",
      validateStatus: (status) => true,
    ),
  );

  Future<Result<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      print("GET $path");
      var response = await dio.get(path, queryParameters: queryParams);
      print("Status: ${response.statusCode}");
      print("Response: ${response.data}");

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data as T);
      }
      return Result.error(Exception(response.data));
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result> post(String path, {required Map<String, dynamic> data}) async {
    try {

      var response = await dio.post(path, data: data);

      print("Status: ${response.statusCode}");
      print("Response: ${response.data}");

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
