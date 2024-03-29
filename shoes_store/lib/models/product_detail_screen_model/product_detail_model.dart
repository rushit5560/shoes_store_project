import 'dart:convert';

ProductDetailsData productDetailsDataFromJson(String str) => ProductDetailsData.fromJson(json.decode(str));

String productDetailsDataToJson(ProductDetailsData data) => json.encode(data.toJson());

class ProductDetailsData {
  ProductDetailsData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => ProductDetailsData(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x ?? {})) ?? []),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    // "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
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
  int brandId;
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
  List<String> images;
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
    upc: json["upc"] ?? "",
    quantity: json["quantity"] ?? 0,
    outofStockStatus: json["OutofStockStatus"] ?? "",
    dateavailable: json["dateavailable"] ?? "",
    sortorder: json["sortorder"] ?? "",
    brandId: json["brand_id"] ?? 0,
    variantsValues: json["variants_values"] ?? "",
    metaTagKeyword: json["meta_tag_Keyword"] ?? "",
    metaTagDescription: json["meta_tag_description"] ?? "",
    showimg: json["showimg"] ?? "",
    metaTagTitle: json["meta_tag_title"] ?? "",
    productcost: json["productcost"] ?? "",
    tax: json["tax"] ?? "",
    taxvalue: json["taxvalue"] ?? "",
    totalcost: json["totalcost"] ?? "",
    requiredshipping: json["requiredshipping"] ?? "",
    width: json["Width"] ?? "",
    height: json["Height"] ?? "",
    length: json["Length"] ?? "",
    weight: json["Weight"] ?? "",
    minimumkg: json["minimumkg"] ?? 1,
    isActive: json["is_active"] ?? "",
    images: List<String>.from(json["images"].map((x) => x)).isEmpty ? [] : List<String>.from(json["images"].map((x) => x)),
    feature: json["feature"] ?? 1,
    todaydeals: json["todaydeals"] ?? 0,
    relatedProducts: json["related_products"] ?? "",
    topProduct: json["top_product"] ?? "",
    createdBy: json["created_by"] ?? "",
    modifiedBy: json["modified_by"]  ?? "",
    createdDate: json["created_date"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
  );

  /*Map<String, dynamic> toJson() => {
    "id": id,
    "productname": productname.isEmpty ? "" : productname,
    "sku": sku.isEmpty ? "" : sku,
    "productslug": productslug.isEmpty ? "" : productslug,
    "full_text": fullText.isEmpty ? "" : fullText,
    "category": category.isEmpty ? "" : category,
    "upc": upc.isEmpty ? "" : upc,
    "quantity": quantity.toString().isEmpty ? 0 : quantity,
    "OutofStockStatus": outofStockStatus.isEmpty ? "" : outofStockStatus,
    "dateavailable": dateavailable.isEmpty ? "" : dateavailable,
    "sortorder": sortorder.isEmpty ? "" : sortorder,
    "brand_id": brandId.isEmpty ? "" : brandId,
    "variants_values": variantsValues.isEmpty ? "" : variantsValues,
    "meta_tag_Keyword": metaTagKeyword.isEmpty ? "" : metaTagKeyword,
    "meta_tag_description": metaTagDescription.isEmpty ? "" : metaTagDescription,
    "showimg": showimg.isEmpty ? "" : showimg,
    "meta_tag_title": metaTagTitle.isEmpty ? "" : metaTagTitle,
    "productcost": productcost.isEmpty ? "" : productcost,
    "tax": tax.isEmpty ? "" : tax,
    "taxvalue": taxvalue.isEmpty ? "" : taxvalue,
    "totalcost": totalcost.isEmpty ? "" : totalcost,
    "requiredshipping": requiredshipping.isEmpty ? "" : requiredshipping,
    "Width": width.isEmpty ? "" : width,
    "Height": height.isEmpty ? "" : height,
    "Length": length.isEmpty ? "" : length,
    "Weight": weight.isEmpty ? "" : weight,
    "minimumkg": minimumkg.toString().isEmpty ? 1 : minimumkg,
    "is_active": isActive.isEmpty ? "" : isActive,
    "images": List<dynamic>.from(images.map((x) => x)).isEmpty ? [] : List<dynamic>.from(images.map((x) => x)),
    "feature": feature.toString().isEmpty ? 1 : feature,
    "todaydeals": todaydeals.toString().isEmpty ? 0 : todaydeals,
    "related_products": relatedProducts.isEmpty ? "" : relatedProducts,
    "top_product": topProduct.isEmpty ? "" : topProduct,
    "created_by": createdBy.isEmpty ? "" : createdBy,
    "modified_by": modifiedBy.isEmpty ? "" : modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate.isEmpty ? "" : modifiedDate,
  };*/
}
