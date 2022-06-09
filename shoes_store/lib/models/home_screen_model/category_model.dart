import 'dart:convert';

GetAllCategoryModel getAllCategoryModelFromJson(String str) => GetAllCategoryModel.fromJson(json.decode(str));

String getAllCategoryModelToJson(GetAllCategoryModel data) => json.encode(data.toJson());

class GetAllCategoryModel {
  GetAllCategoryModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<CategoryElement> list;

  factory GetAllCategoryModel.fromJson(Map<String, dynamic> json) => GetAllCategoryModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<CategoryElement>.from(json["List"].map((x) => CategoryElement.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class CategoryElement {
  CategoryElement({
    required this.id,
    required this.name,
    required this.categoryImage,
    required this.isActive,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String categoryImage;
  bool isActive;
  // DateTime createdAt;
  // DateTime updatedAt;
  int v;

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    categoryImage: json["CategoryImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "CategoryImage": categoryImage,
    "IsActive": isActive,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
