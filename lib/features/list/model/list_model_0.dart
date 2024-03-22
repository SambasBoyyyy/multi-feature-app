class ListModel_0 {
  ListModel_0({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });
  late final String status;
  late final String message;
  late final Error error;
  late final Data data;

  ListModel_0.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    error = Error.fromJson(json['error']);
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['error'] = error.toJson();
    _data['data'] = data.toJson();
    return _data;
  }
}

class Error {
  Error();

  Error.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Data {
  Data({
    required this.totalunread,
    required this.results,
  });
  late final int totalunread;
  late final List<Results> results;

  Data.fromJson(Map<String, dynamic> json){
    totalunread = json['totalunread'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalunread'] = totalunread;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.userId,
    this.image,
    required this.title,
    required this.description,
    required this.readStatus,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final int userId;
  late final String? image;
  late final String title;
  late final String description;
  late final String readStatus;
  late final String createdAt;
  late final String? updatedAt;
  late final Null deletedAt;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    image = null;
    title = json['title'];
    description = json['description'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    updatedAt = null;
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['image'] = image;
    _data['title'] = title;
    _data['description'] = description;
    _data['read_status'] = readStatus;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}