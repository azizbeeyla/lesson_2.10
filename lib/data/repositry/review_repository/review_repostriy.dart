import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/review_model/review_model.dart';
import 'package:lesson2_10/data/result.dart';

class ReviewRepositry {
  final ApiClient _apiClient;

  ReviewRepositry({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<ReviewModel>> getReviewById(int id) async {
    final result = await _apiClient.get<dynamic>(
      "/recipes/reviews/detail/$id",
    );

    return result.fold(
          (error) => Result.error(error),
          (data) {
        print("🔍 API'dan kelgan raw data: $data");
        print("🔍 Data type: ${data.runtimeType}");

        // Null yoki noto'g'ri formatni tekshirish
        if (data == null) {
          return Result.error(Exception("Serverdan bo'sh ma'lumot qaytdi"));
        }

        // Agar data List bo'lsa, uni mapga o'tkazish mumkin
        Map<String, dynamic>? mapData;
        if (data is Map<String, dynamic>) {
          mapData = data;
        } else if (data is Map) {
          mapData = Map<String, dynamic>.from(data);
        } else {
          return Result.error(Exception("Kutilgan format emas: $data"));
        }

        try {
          final review = ReviewModel.fromJson(mapData);
          return Result.ok(review);
        } catch (e) {
          return Result.error(Exception("JSON parse xatolik: $e"));
        }
      },
    );
  }

}


