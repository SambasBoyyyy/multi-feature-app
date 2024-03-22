import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'list.g.dart';

@JsonSerializable(explicitToJson: true)
class ListModel {
  String status;
  String message;
  Error error;
  Data data;

  ListModel({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });


  factory ListModel.fromJson(Map<String,dynamic> data) => _$ListModelFromJson(data);

  Map<String,dynamic> toJson() => _$ListModelToJson(this);


}
class Error {
  Error();
  Error.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
