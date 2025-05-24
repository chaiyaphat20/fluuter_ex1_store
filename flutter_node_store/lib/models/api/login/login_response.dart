import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  String status;
  String message;
  String token;
  User user;

  LoginResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  int id;
  String firstname;
  String lastname;
  String email;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
