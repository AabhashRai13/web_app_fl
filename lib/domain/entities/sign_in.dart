import 'dart:convert';

SignIn signInFromJson(String str) {
  final jsonData = json.decode(str);
  return SignIn.fromJson(jsonData);
}

String signInToJson(SignIn data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SignIn {
  final String username;
  final String password;

  SignIn({
    required this.username,
    required this.password,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
