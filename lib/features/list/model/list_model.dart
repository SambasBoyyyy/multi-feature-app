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

}

class Data {
  int totalunread;
  List<Result> results;

  Data({
    required this.totalunread,
    required this.results,
  });

}

class Result {
  int id;
  int userId;
  String? image;
  Title title;
  Description description;
  ReadStatus readStatus;
  DateTime createdAt;
  DateTime? updatedAt;
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
    required this.deletedAt,
  });

}

enum Description {
  DESCRIPTION_DESCRIPTION,
  FINALLY_TIME_TO_GO_TO_BED
}

enum ReadStatus {
  NO,
  YES
}

enum Title {
  DONE,
  TITLE_DESCRIPTION
}

class Error {
  Error();
}
