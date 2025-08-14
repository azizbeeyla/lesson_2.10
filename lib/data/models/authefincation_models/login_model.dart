class LoginModel {
  final String login;
  final String password;

  LoginModel({required this.login, required this.password});

  Map<String, dynamic> toJson() {
    return {"login": login, "password": password};
  }

  @override
  String toString() {
    return 'LoginModel{login: $login, password: $password}';
  }
}
