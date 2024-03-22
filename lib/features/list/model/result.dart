import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Results {
  int? id;
  int? userId;
  String? image;
  String? title;
  String? description;
  String? readStatus;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Results({
     this.id,
     this.userId,
     this.image,
     this.title,
     this.description,
     this.readStatus,
     this.createdAt,
     this.updatedAt,
     this.deletedAt,
  });

  factory Results.fromJson(Map<String,dynamic> data) => _$ResultsFromJson(data);

  Map<String,dynamic> toJson() => _$ResultsToJson(this);


}
