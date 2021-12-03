import 'package:json_annotation/json_annotation.dart';

part 'json_parsers/user_model.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String email;
  final String username;
  final String password;
  final String phoneNumber;
  final String facebookAccount;

  const User(
    this.id,
    this.email,
    this.username,
    this.password,
    this.phoneNumber,
    this.facebookAccount,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
