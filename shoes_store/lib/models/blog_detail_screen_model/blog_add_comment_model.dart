// To parse this JSON data, do
//
//     final blogAddCommentModel = blogAddCommentModelFromJson(jsonString);

import 'dart:convert';

BlogAddCommentModel blogAddCommentModelFromJson(String str) => BlogAddCommentModel.fromJson(json.decode(str));

String blogAddCommentModelToJson(BlogAddCommentModel data) => json.encode(data.toJson());

class BlogAddCommentModel {
  BlogAddCommentModel({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory BlogAddCommentModel.fromJson(Map<String, dynamic> json) => BlogAddCommentModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
