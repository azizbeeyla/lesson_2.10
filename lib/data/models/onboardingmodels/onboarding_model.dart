
class OnboardingModel {
  final int id;
  final String image;

  OnboardingModel({required this.id, required this.image});

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      id: json['id'],
      image: json['image'],
    );
  }
}
