import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Results {
  int id;
  int userId;
  String? image;
  String title;
  String description;
  String readStatus;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Results({
    required this.id,
    required this.userId,
    required this.image,
    required this.title,
    required this.description,
    required this.readStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Results.fromJson(Map<String,dynamic> data) => _$ResultsFromJson(data);

  Map<String,dynamic> toJson() => _$ResultsToJson(this);


}
