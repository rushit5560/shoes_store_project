import 'dart:convert';

AllProductsModel allProductsModelFromJson(String str) => AllProductsModel.fromJson(json.decode(str));

String allProductsModelToJson(AllProductsModel data) => json.encode(data.toJson());

class AllProductsModel {
  AllProductsModel({
    required this.status,
    required this.message,
    required this.list,
  });

  bool status;
  String message;
  List<ProductElement> list;

  factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    list: List<ProductElement>.from(json["List"].map((x) => ProductElement.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "List": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ProductElement {
  ProductElement({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.details,
    required this.category,
    required this.brand,
    required this.isActive,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String price;
  String image;
  String details;
  Category category;
  Brand brand;
  bool isActive;
  // DateTime createdAt;
  // DateTime updatedAt;
  int v;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    price: json["Price"] ?? "",
    image: json["Image"] ?? "",
    details: json["Details"] ?? "",
    category: Category.fromJson(json["Category"] ?? {}),
    brand: Brand.fromJson(json["Brand"] ?? {}),
    isActive: json["IsActive"] ?? false,
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "Price": price,
    "Image": image,
    "Details": details,
    "Category": category.toJson(),
    "Brand": brand.toJson(),
    "IsActive": isActive,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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


class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.brandImage,
    required this.isActive,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String brandImage;
  bool isActive;
  // DateTime createdAt;
  // DateTime updatedAt;
  int v;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"] ?? "",
    name: json["Name"] ?? "",
    brandImage: json["BrandImage"] ?? "",
    isActive: json["IsActive"] ?? false,
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Name": name,
    "BrandImage": brandImage,
    "IsActive": isActive,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
