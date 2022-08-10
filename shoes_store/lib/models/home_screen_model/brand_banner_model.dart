// To parse this JSON data, do
//
//     final getBrandBannerModel = getBrandBannerModelFromJson(jsonString);

import 'dart:convert';

GetBrandBannerModel getBrandBannerModelFromJson(String str) =>
    GetBrandBannerModel.fromJson(json.decode(str));

String getBrandBannerModelToJson(GetBrandBannerModel data) =>
    json.encode(data.toJson());

class GetBrandBannerModel {
  GetBrandBannerModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<BrandBanner> data;
  String message;

  factory GetBrandBannerModel.fromJson(Map<String, dynamic> json) =>
      GetBrandBannerModel(
        success: json["success"] ?? false,
        data: List<BrandBanner>.from(
            json["data"].map((x) => BrandBanner.fromJson(x)) ?? {}),
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class BrandBanner {
  BrandBanner({
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.sortOrder,
    required this.isActive,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  int brandId;
  String brandName;
  String brandImage;
  String sortOrder;
  int isActive;
  String createdDate;
  String updatedDate;
  int createdBy;
  int modifiedBy;

  factory BrandBanner.fromJson(Map<String, dynamic> json) => BrandBanner(
        brandId: json["brandID"] ?? 0,
        brandName: json["brandName"] ?? "",
        brandImage: json["brandImage"] ?? "",
        sortOrder: json["sort_order"] ?? "",
        isActive: json["is_active"] ?? 0,
        createdDate: json["created_date"] ?? "",
        updatedDate: json["updated_date"] ?? "",
        createdBy: json["created_by"] ?? 0,
        modifiedBy: json["modified_by"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "brandID": brandId,
        "brandName": brandName,
        "brandImage": brandImage,
        "sort_order": sortOrder,
        "is_active": isActive,
        "created_date": createdDate,
        "updated_date": updatedDate,
        "created_by": createdBy,
        "modified_by": modifiedBy,
      };
}
