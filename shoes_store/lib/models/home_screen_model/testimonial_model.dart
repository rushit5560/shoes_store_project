// To parse this JSON data, do
//
//     final testimonialsModel = testimonialsModelFromJson(jsonString);

import 'dart:convert';

TestimonialsModel testimonialsModelFromJson(String str) => TestimonialsModel.fromJson(json.decode(str));

String testimonialsModelToJson(TestimonialsModel data) => json.encode(data.toJson());

class TestimonialsModel {
  TestimonialsModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<TestimonialDetails> data;
  String message;

  factory TestimonialsModel.fromJson(Map<String, dynamic> json) => TestimonialsModel(
    success: json["success"] ?? false,
    data: List<TestimonialDetails>.from(json["data"].map((x) => TestimonialDetails.fromJson(x ?? {})) ?? []),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class TestimonialDetails {
  TestimonialDetails({
    required this.id,
    required this.name,
    required this.image,
    required this.shortDescritpon,
    required this.description,
    required this.location,
    required this.isActive,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.updatedDate,
    required this.showimg,
  });

  int id;
  String name;
  String image;
  String shortDescritpon;
  String description;
  String location;
  int isActive;
  int createdBy;
  int modifiedBy;
  String createdDate;
  String updatedDate;
  String showimg;

  factory TestimonialDetails.fromJson(Map<String, dynamic> json) => TestimonialDetails(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    image: json["image"] ?? "",
    shortDescritpon: json["short_descritpon"] ?? "",
    description: json["description"] ?? "",
    location: json["location"] ?? "",
    isActive: json["is_active"] ?? 0,
    createdBy: json["created_by"] ?? 0,
    modifiedBy: json["modified_by"] ?? 0,
    createdDate: json["created_date"] ?? "",
    updatedDate: json["updated_date"] ?? "",
    showimg: json["showimg"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "short_descritpon": shortDescritpon,
    "description": description,
    "location": location,
    "is_active": isActive,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "updated_date": updatedDate,
    "showimg": showimg,
  };
}
