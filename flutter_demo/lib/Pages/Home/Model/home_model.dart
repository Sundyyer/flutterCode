// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

home_model welcomeFromJson(String str) => home_model.fromJson(json.decode(str));

String welcomeToJson(home_model data) => json.encode(data.toJson());

class home_model {
  String reason;
  Result result;
  int errorCode;

  home_model({
    required this.reason,
    required this.result,
    required this.errorCode,
  });

  factory home_model.fromJson(Map<String, dynamic> json) => home_model(
    reason: json["reason"],
    result: Result.fromJson(json["result"]),
    errorCode: json["error_code"],
  );

  Map<String, dynamic> toJson() => {
    "reason": reason,
    "result": result.toJson(),
    "error_code": errorCode,
  };
}

class Result {
  String stat;
  List<Datum> data;
  String page;
  String pageSize;

  Result({
    required this.stat,
    required this.data,
    required this.page,
    required this.pageSize,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    stat: json["stat"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    page: json["page"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "stat": stat,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "page": page,
    "pageSize": pageSize,
  };
}

class Datum {
  String uniquekey;
  String title;
  DateTime date;
  Category category;
  String authorName;
  String url;
  String thumbnailPicS;
  String? thumbnailPicS02;
  String? thumbnailPicS03;
  String isContent;

  Datum({
    required this.uniquekey,
    required this.title,
    required this.date,
    required this.category,
    required this.authorName,
    required this.url,
    required this.thumbnailPicS,
    this.thumbnailPicS02,
    this.thumbnailPicS03,
    required this.isContent,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uniquekey: json["uniquekey"],
    title: json["title"],
    date: DateTime.parse(json["date"]),
    category: categoryValues.map[json["category"]]!,
    authorName: json["author_name"],
    url: json["url"],
    thumbnailPicS: json["thumbnail_pic_s"],
    thumbnailPicS02: json["thumbnail_pic_s02"],
    thumbnailPicS03: json["thumbnail_pic_s03"],
    isContent: json["is_content"],
  );

  Map<String, dynamic> toJson() => {
    "uniquekey": uniquekey,
    "title": title,
    "date": date.toIso8601String(),
    "category": categoryValues.reverse[category],
    "author_name": authorName,
    "url": url,
    "thumbnail_pic_s": thumbnailPicS,
    "thumbnail_pic_s02": thumbnailPicS02,
    "thumbnail_pic_s03": thumbnailPicS03,
    "is_content": isContent,
  };
}

enum Category { EMPTY }

final categoryValues = EnumValues({
  "头条": Category.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
