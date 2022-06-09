import 'dart:convert';

GetTestimonialModel getTestimonialModelFromJson(String str) => GetTestimonialModel.fromJson(json.decode(str));

String getTestimonialModelToJson(GetTestimonialModel data) => json.encode(data.toJson());

class GetTestimonialModel {
  GetTestimonialModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<TestimonialElement> list;

  factory GetTestimonialModel.fromJson(Map<String, dynamic> json) => GetTestimonialModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<TestimonialElement>.from(json["List"].map((x) => TestimonialElement.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class TestimonialElement {
  TestimonialElement({
    required this.id,
    required this.name,
    required this.description,
    required this.testimonialImage,
    required this.isActive,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String description;
  String testimonialImage;
  bool isActive;
  // DateTime createdAt;
  // DateTime updatedAt;
  int v;

  factory TestimonialElement.fromJson(Map<String, dynamic> json) => TestimonialElement(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    description: json["Description"] ?? "",
    testimonialImage: json["TestimonialImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Description": description,
    "TestimonialImage": testimonialImage,
    "IsActive": isActive,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
