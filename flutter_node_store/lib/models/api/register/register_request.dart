import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  RegisterRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  factory RegisterRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegisterRequestToJson(this);
}
