import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponse {
  String status;
  String message;
  String token;

  @JsonKey(
    includeIfNull: false,
  ) // ไม่รวมใน JSON ถ้า user เป็น null
  User? user;

  RegisterResponse({
    required this.status,
    required this.message,
    required this.token,
    this.user,
  });

  factory RegisterResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegisterResponseToJson(this);
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
