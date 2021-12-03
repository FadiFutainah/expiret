part of '../review_model.dart';

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      json['id'] as int,
      json['stars'] as int,
      json['comment'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'stars': instance.stars,
      'comment': instance.comment,
      'username': instance.username,
    };
