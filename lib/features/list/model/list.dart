import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'list.g.dart';

@JsonSerializable(explicitToJson: true)
class List {
  String status;
  String message;
  Error error;
  Data data;

  List({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });


  factory List.fromJson(Map<String,dynamic> data) => _$ListFromJson(data);

  Map<String,dynamic> toJson() => _$ListToJson(this);


}
class Error {
  Error();
  Error.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
