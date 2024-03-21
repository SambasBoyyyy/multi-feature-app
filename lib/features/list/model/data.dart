import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  int totalunread;
  List<Results> results;

  Data({
    required this.totalunread,
    required this.results,
  });

  factory Data.fromJson(Map<String,dynamic> data) => _$DataFromJson(data);

  Map<String,dynamic> toJson() => _$DataToJson(this);


}
