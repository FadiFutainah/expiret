import 'package:expiret/models/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'like_model.dart';

part 'json_parsers/product_model.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final int views;
  final String name;
  final double price;
  final String image;
  final int quantity;
  final String details;
  final double discount;
  final String category;
  final List<Like> likes;
  final String phoneNumber;
  final DateTime expireDate;
  final List<Review> reviews;
  final String facebookAccount;

  const Product(
    this.id,
    this.views,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.details,
    this.discount,
    this.category,
    this.likes,
    this.phoneNumber,
    this.expireDate,
    this.reviews,
    this.facebookAccount,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
