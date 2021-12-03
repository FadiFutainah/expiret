import 'package:json_annotation/json_annotation.dart';

part 'json_parsers/like_model.g.dart';

@JsonSerializable()
class Like {
  final int userId;

  const Like(
    this.userId,
  );

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
