part of '../user_model.dart';

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['email'] as String,
      json['username'] as String,
      json['password'] as String,
      json['phoneNumber'] as String,
      json['facebookAccount'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'facebookAccount': instance.facebookAccount,
    };



