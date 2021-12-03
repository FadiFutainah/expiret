part of '../product_model.dart';

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      json['views'] as int,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['image'] as String,
      json['quantity'] as int,
      json['details'] as String,
      (json['discount'] as num).toDouble(),
      json['category'] as String,
      (json['likes'] as List<dynamic>)
          .map((e) => Like.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['phoneNumber'] as String,
      DateTime.parse(json['expireDate'] as String),
      (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['facebookAccount'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'views': instance.views,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
      'details': instance.details,
      'discount': instance.discount,
      'category': instance.category,
      'likes': instance.likes,
      'phoneNumber': instance.phoneNumber,
      'expireDate': instance.expireDate.toIso8601String(),
      'reviews': instance.reviews,
      'facebookAccount': instance.facebookAccount,
    };
