import 'dart:convert';

UserCartData userCartDataFromJson(String str) => UserCartData.fromJson(json.decode(str));

String userCartDataToJson(UserCartData data) => json.encode(data.toJson());

class UserCartData {
  UserCartData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory UserCartData.fromJson(Map<String, dynamic> json) => UserCartData(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.cart,
    required this.cartditeil,
  });

  Cart cart;
  List<Cartditeil> cartditeil;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cart: Cart.fromJson(json["cart"] ?? {}),
    cartditeil: List<Cartditeil>.from(json["cartditeil"].map((x) => Cartditeil.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
    "cartditeil": List<dynamic>.from(cartditeil.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    this.cartId,
    this.totalprice,
    this.totalqty,
    this.couponid,
    this.coupontype,
    this.couponvalue,
    this.userId,
    this.createdDate,
    this.updatedDate,
  });

  int? cartId;
  int? totalprice;
  int? totalqty;
  String? couponid;
  String? coupontype;
  String? couponvalue;
  String? userId;
  String? createdDate;
  String? updatedDate;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cartId"],
    totalprice: json["totalprice"] == null ? 0 : json["totalprice"],
    totalqty: json["totalqty"] == null ? 0 : json["totalqty"],
    couponid: json["couponid"] == null ? "" : json["couponid"],
    coupontype: json["coupontype"] == null ? "" : json["coupontype"],
    couponvalue: json["couponvalue"] == null ? "" : json["couponvalue"],
    userId: json["userId"],
    createdDate: json["created_date"],
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "totalprice": totalprice.toString().isEmpty ? 0 : totalprice,
    "totalqty": totalqty.toString().isEmpty ? 0 : totalqty,
    "couponid": couponid!.isEmpty ? "" : couponid,
    "coupontype": coupontype!.isEmpty ? "" : coupontype,
    "couponvalue": couponvalue!.isEmpty ? "" : couponvalue,
    "userId": userId!.isEmpty ? "" : userId,
    "created_date": createdDate,
    "updated_date": updatedDate!.isEmpty ? "" : updatedDate,
  };
}

class Cartditeil {
  Cartditeil({
    required this.cartDetailId,
    required this.cartId,
    required this.productId,
    required this.variyantid,
    required this.productKg,
    required this.quantity,
    required this.createdDate,
    required this.updatedDate,
    required this.id,
    required this.name,
    required this.type,
    required this.sortOrder,
    required this.valueNameNSortOrder,
    required this.createdBy,
    required this.updatedBy,
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    required this.upc,
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
    required this.modifiedBy,
    required this.modifiedDate,
    required this.cquantity,
  });

  int cartDetailId;
  int cartId;
  String productId;
  String variyantid;
  int productKg;
  int quantity;
  String createdDate;
  String updatedDate;
  int id;
  String name;
  String type;
  String sortOrder;
  String valueNameNSortOrder;
  String createdBy;
  String updatedBy;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  String upc;
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
  int totalcost;
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
  String modifiedBy;
  String modifiedDate;
  int cquantity;

  factory Cartditeil.fromJson(Map<String, dynamic> json) => Cartditeil(
    cartDetailId: json["cartDetailId"] ?? 0,
    cartId: json["cartId"] ?? 0,
    productId: json["productId"] ?? "",
    variyantid: json["variyantid"].toString(),
    productKg: json["product_kg"] ?? 0,
    quantity: json["quantity"] ?? 0,
    createdDate: json["created_date"] ?? "",
    updatedDate: json["updated_date"] ?? "",
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    type: json["type"] ?? "",
    sortOrder: json["sort_order"] ?? "",
    valueNameNSortOrder: json["value_name_n_sort_order"] ?? "",
    createdBy: json["created_by"] ?? "",
    updatedBy: json["updated_by"] ?? "",
    productname: json["productname"] ?? "",
    sku: json["sku"] ?? "",
    productslug: json["productslug"] ?? "",
    fullText: json["full_text"] ?? "",
    category: json["category"] ?? "",
    upc: json["upc"] ?? "",
    outofStockStatus: json["OutofStockStatus"] ?? "",
    dateavailable: json["dateavailable"] ?? "",
    sortorder: json["sortorder"] ?? "",
    brandId: json["brand_id"] ?? "",
    variantsValues: json["variants_values"] ?? "",
    metaTagKeyword: json["meta_tag_Keyword"] ?? "",
    metaTagDescription: json["meta_tag_description"] ?? "",
    showimg: json["showimg"] ?? "",
    metaTagTitle: json["meta_tag_title"] ?? "",
    productcost: json["productcost"].toString(),
    tax: json["tax"] ?? "",
    taxvalue: json["taxvalue"] ?? "",
    totalcost: json["totalcost"] ?? 0,
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
    modifiedBy: json["modified_by"] ?? "",
    modifiedDate: json["modified_date"] ?? "",
    cquantity: json["cquantity"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "cartDetailId": cartDetailId,
    "cartId": cartId,
    "productId": productId,
    "variyantid": variyantid,
    "product_kg": productKg,
    "quantity": quantity,
    "created_date": createdDate,
    "updated_date": updatedDate,
    "id": id,
    "name": name,
    "type": type,
    "sort_order": sortOrder,
    "value_name_n_sort_order": valueNameNSortOrder,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "productname": productname,
    "sku": sku,
    "productslug": productslug,
    "full_text": fullText,
    "category": category,
    "upc": upc,
    "OutofStockStatus": outofStockStatus,
    "dateavailable": dateavailable,
    "sortorder": sortorder,
    "brand_id": brandId,
    "variants_values": variantsValues,
    "meta_tag_Keyword": metaTagKeyword,
    "meta_tag_description": metaTagDescription,
    "showimg": showimg,
    "meta_tag_title": metaTagTitle,
    "productcost": productcost,
    "tax": tax,
    "taxvalue": taxvalue,
    "totalcost": totalcost,
    "requiredshipping": requiredshipping,
    "Width": width,
    "Height": height,
    "Length": length,
    "Weight": weight,
    "minimumkg": minimumkg,
    "is_active": isActive,
    "images": images,
    "feature": feature,
    "todaydeals": todaydeals,
    "related_products": relatedProducts,
    "top_product": topProduct,
    "modified_by": modifiedBy,
    "modified_date": modifiedDate,
    "cquantity": cquantity,
  };
}
