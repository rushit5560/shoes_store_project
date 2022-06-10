import 'dart:convert';

BlogData blogDataFromJson(String str) => BlogData.fromJson(json.decode(str));

String blogDataToJson(BlogData data) => json.encode(data.toJson());

class BlogData {
  BlogData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory BlogData.fromJson(Map<String, dynamic> json) => BlogData(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {})) ?? []),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.sortOrder,
    required this.isActive,
    required this.relatedBlogs,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.updatedDate,
    required this.showimg,
  });

  int id;
  String title;
  String content;
  String image;
  String sortOrder;
  int isActive;
  String relatedBlogs;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int createdBy;
  int modifiedBy;
  DateTime createdDate;
  DateTime updatedDate;
  String showimg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"] == null ? "" : json["title"],
    content: json["content"] == null ? "" : json["content"],
    image: json["image"] == null ? "" : json["image"],
    sortOrder: json["sort_order"] == null ? "" : json["sort_order"],
    isActive: json["is_active"].toString().isEmpty ? 1 : json["is_active"],
    relatedBlogs: json["related_blogs"] == null ? "" : json["related_blogs"],
    metaTitle: json["meta_title"] == null ? "" : json["meta_title"],
    metaDescription: json["meta_description"] == null ? "" : json["meta_description"],
    metaKeywords: json["meta_keywords"] == null ? "" : json["meta_keywords"],
    createdBy: json["created_by"].toString().isEmpty ? 1 : json["created_by"],
    modifiedBy: json["modified_by"].toString().isEmpty ? 1 : json["modified_by"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
    showimg: json["showimg"] == null ? "" : json["showimg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.isEmpty ? "" : title,
    "content": content.isEmpty ? "" : content,
    "image": image.isEmpty ? "" : image,
    "sort_order": sortOrder.isEmpty ? "" : sortOrder,
    "is_active": isActive.toString().isEmpty ? 1 : isActive,
    "related_blogs": relatedBlogs.isEmpty ? "" : relatedBlogs,
    "meta_title": metaTitle.isEmpty ? "" : metaTitle,
    "meta_description": metaDescription.isEmpty ? "" : metaDescription,
    "meta_keywords": metaKeywords.isEmpty ? "" : metaKeywords,
    "created_by": createdBy.toString().isEmpty ? 1 : createdBy,
    "modified_by": modifiedBy.toString().isEmpty ? 1 : modifiedBy,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
    "showimg": showimg.isEmpty ? "" : showimg,
  };
}
