import 'package:json_annotation/json_annotation.dart';

part 'json_parsers/review_model.g.dart';

@JsonSerializable()
class Review {
  final int id;
  final int stars;
  final String comment;
  final String username;

  const Review(
    this.id,
    this.stars,
    this.comment,
    this.username,
  );

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
