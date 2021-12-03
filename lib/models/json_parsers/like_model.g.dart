part of '../like_model.dart';

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      json['userId'] as int,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'userId': instance.userId,
    };
