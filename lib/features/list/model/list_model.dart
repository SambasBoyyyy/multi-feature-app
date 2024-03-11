class ListModel {
  String status;
  String message;
  Map<String, dynamic> error;
  Data data;

  ListModel({required this.status, required this.message, required this.error, required this.data});

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      status: json['status'],
      message: json['message'],
      error: json['error'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int totalUnread;
  List<Result> results;

  Data({required this.totalUnread, required this.results});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalUnread: json['totalunread'],
      results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  int id;
  int userId;
  String image;
  String title;
  String description;
  String readStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Result({
    required this.id,
    required this.userId,
    required this.image,
    required this.title,
    required this.description,
    required this.readStatus,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      userId: json['user_id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      readStatus: json['read_status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}
