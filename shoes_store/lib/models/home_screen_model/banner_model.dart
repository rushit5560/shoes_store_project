import 'dart:convert';

GetAllBannerModel getAllBannerModelFromJson(String str) => GetAllBannerModel.fromJson(json.decode(str));

String getAllBannerModelToJson(GetAllBannerModel data) => json.encode(data.toJson());

class GetAllBannerModel {
  GetAllBannerModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<BannerElement> list;

  factory GetAllBannerModel.fromJson(Map<String, dynamic> json) => GetAllBannerModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<BannerElement>.from(json["List"].map((x) => BannerElement.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class BannerElement {
  BannerElement({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.bannerImage,
    required this.isActive,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String subTitle;
  String description;
  String bannerImage;
  bool isActive;
  // String createdAt;
  // String updatedAt;
  int v;

  factory BannerElement.fromJson(Map<String, dynamic> json) => BannerElement(
    id: json["_id"] ?? "",
    title: json["Title"] ?? "",
    subTitle: json["SubTitle"] ?? "",
    description: json["Description"] ?? "",
    bannerImage: json["BannerImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Title": title,
    "SubTitle": subTitle,
    "Description": description,
    "BannerImage": bannerImage,
    "IsActive": isActive,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
