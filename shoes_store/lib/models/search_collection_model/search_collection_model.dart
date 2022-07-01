// To parse this JSON data, do
//
//     final searchProductModel = searchProductModelFromJson(jsonString);

import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) => SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) => json.encode(data.toJson());

class SearchProductModel {
  SearchProductModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    required this.upc,
    required this.quantity,
    required this.outofStockStatus,
    required this.dateavailable,
    required this.sortorder,
    required this.brandId,
    required this.variantsValues,
    required this.metaTagKeyword,
    required this.metaTagDescription,
    required this.showimg,
    required this.metaTagTitle,
    required this.productcost,
    required this.tax,
    required this.taxvalue,
    required this.totalcost,
    required this.requiredshipping,
    required this.width,
    required this.height,
    required this.length,
    required this.weight,
    required this.minimumkg,
    required this.isActive,
    required this.images,
    required this.feature,
    required this.todaydeals,
    required this.relatedProducts,
    required this.topProduct,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
  });

  int id;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  String upc;
  int quantity;
  String outofStockStatus;
  String dateavailable;
  String sortorder;
  String brandId;
  String variantsValues;
  String metaTagKeyword;
  String metaTagDescription;
  String showimg;
  String metaTagTitle;
  String productcost;
  String tax;
  String taxvalue;
  String totalcost;
  String requiredshipping;
  String width;
  String height;
  String length;
  String weight;
  int minimumkg;
  String isActive;
  String images;
  int feature;
  int todaydeals;
  String relatedProducts;
  String topProduct;
  String createdBy;
  String modifiedBy;
  String createdDate;
  String modifiedDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    productname: json["productname"] ?? "",
    sku: json["sku"] ?? "",
    productslug: json["productslug"] ?? "",
    fullText: json["full_text"] ?? "",
    category: json["category"] ?? "",
    upc: json["upc"] ??"",
    quantity: json["quantity"] ?? 0,
    outofStockStatus: json["OutofStockStatus"] ?? "",
    dateavailable: json["dateavailable"] ?? "",
    sortorder: json["sortorder"] ?? "",
    brandId: json["brand_id"] ?? "",
    variantsValues: json["variants_values"] ?? "",
    metaTagKeyword: json["meta_tag_Keyword"] ?? "",
    metaTagDescription: json["meta_tag_description"] ?? "",
    showimg: json["showimg"] ?? "",
    metaTagTitle: json["meta_tag_title"] ?? "",
    productcost: json["productcost"] ?? "",
    tax: json["tax"] ?? "",
    taxvalue: json["taxvalue"] ?? "",
    totalcost: json["totalcost"] ??"",
    requiredshipping: json["requiredshipping"] ?? "",
    width: json["Width"] ?? "",
    height: json["Height"] ?? "",
    length: json["Length"] ?? "",
    weight: json["Weight"] ?? "",
    minimumkg: json["minimumkg"] ?? 0,
    isActive: json["is_active"] ?? "",
    images: json["images"] ?? "",
    feature: json["feature"] ?? 0,
    todaydeals: json["todaydeals"] ?? 0,
    relatedProducts: json["related_products"] ?? "",
    topProduct: json["top_product"] ?? "",
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"] ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productname": productname,
    "sku": sku,
    "productslug": productslug,
    "full_text": fullText,
    "category": category,
    "upc": upc == null ? null : upc,
    "quantity": quantity == null ? null : quantity,
    "OutofStockStatus": outofStockStatus == null ? null : outofStockStatus,
    "dateavailable": dateavailable,
    "sortorder": sortorder == null ? null : sortorder,
    "brand_id": brandId,
    "variants_values": variantsValues,
    "meta_tag_Keyword": metaTagKeyword == null ? null : metaTagKeyword,
    "meta_tag_description": metaTagDescription == null ? null : metaTagDescription,
    "showimg": showimg == null ? null : showimg,
    "meta_tag_title": metaTagTitle == null ? null : metaTagTitle,
    "productcost": productcost,
    "tax": tax,
    "taxvalue": taxvalue == null ? null : taxvalue,
    "totalcost": totalcost,
    "requiredshipping": requiredshipping,
    "Width": width == null ? null : width,
    "Height": height == null ? null : height,
    "Length": length == null ? null : length,
    "Weight": weight == null ? null : weight,
    "minimumkg": minimumkg == null ? null : minimumkg,
    "is_active": isActive,
    "images": images == null ? null : images,
    "feature": feature,
    "todaydeals": todaydeals == null ? null : todaydeals,
    "related_products": relatedProducts,
    "top_product": topProduct,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate == null ? null : createdDate,
    "modified_date": modifiedDate,
  };
}
