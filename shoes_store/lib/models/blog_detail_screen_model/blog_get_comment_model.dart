// To parse this JSON data, do
//
//     final blogGetCommentModel = blogGetCommentModelFromJson(jsonString);

import 'dart:convert';

BlogGetCommentModel blogGetCommentModelFromJson(String str) => BlogGetCommentModel.fromJson(json.decode(str));

String blogGetCommentModelToJson(BlogGetCommentModel data) => json.encode(data.toJson());

class BlogGetCommentModel {
  BlogGetCommentModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory BlogGetCommentModel.fromJson(Map<String, dynamic> json) => BlogGetCommentModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.blogId,
    required this.userId,
    required this.comment,
    required this.isActive,
    required this.createdDate,
    required this.parent,
  });

  int id;
  int blogId;
  int userId;
  String comment;
  int isActive;
  String createdDate;
  String parent;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    blogId: json["blog_id"] ?? 0,
    userId: json["user_id"] ?? 0,
    comment: json["comment"] ?? "",
    isActive: json["is_active"] ?? 0,
    createdDate: json["created_date"] ?? "",
    parent: json["parent"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "blog_id": blogId,
    "user_id": userId,
    "comment": comment,
    "is_active": isActive,
    "created_date": createdDate,
    "parent": parent,
  };
}
