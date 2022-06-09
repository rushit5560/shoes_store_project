// To parse this JSON data, do
//
//     final bannerData = bannerDataFromJson(jsonString);

import 'dart:convert';

BannerData bannerDataFromJson(String str) => BannerData.fromJson(json.decode(str));

String bannerDataToJson(BannerData data) => json.encode(data.toJson());

class BannerData {
  BannerData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
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
    required this.bannerId,
    required this.title,
    required this.sortOrder,
    required this.url,
    required this.bannerGroupId,
    required this.containerName,
    required this.viewPageCount,
    required this.bannerGroupBannerGroupId,
    required this.link,
    required this.image,
    required this.imagePath,
    required this.content,
    required this.position,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  int bannerId;
  String title;
  String sortOrder;
  String url;
  String bannerGroupId;
  String containerName;
  int viewPageCount;
  String bannerGroupBannerGroupId;
  String link;
  String image;
  String imagePath;
  String content;
  int position;
  int isActive;
  DateTime createdDate;
  String modifiedDate;
  int createdBy;
  String modifiedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    bannerId: json["banner_id"] ?? 0,
    title: json["title"] ?? "",
    sortOrder: json["sort_order"] ?? "",
    url: json["url"] ?? "",
    bannerGroupId: json["banner_group_id"] ?? "",
    containerName: json["container_name"] ?? "",
    viewPageCount: json["view_page_count"] ?? 0,
    bannerGroupBannerGroupId: json["banner_group_banner_group_id"] ?? "",
    link: json["link"] ?? "",
    image: json["image"] ?? "",
    imagePath: json["image_path"] ?? "",
    content: json["content"] ?? "",
    position: json["position"] ?? 0,
    isActive: json["is_active"] ?? 0,
    createdDate: DateTime.parse(json["created_date"] ?? DateTime.now()),
    modifiedDate: json["modified_date"] ?? "",
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "title": title,
    "sort_order": sortOrder,
    "url": url,
    "banner_group_id": bannerGroupId,
    "container_name": containerName,
    "view_page_count": viewPageCount,
    "banner_group_banner_group_id": bannerGroupBannerGroupId,
    "link": link,
    "image": image,
    "image_path": imagePath,
    "content": content,
    "position": position == null ? null : position,
    "is_active": isActive,
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate,
    "created_by": createdBy,
    "modified_by": modifiedBy,
  };
}
