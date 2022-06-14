import 'dart:convert';

TotalOrdersModel totalOrdersModelFromJson(String str) => TotalOrdersModel.fromJson(json.decode(str));

String totalOrdersModelToJson(TotalOrdersModel data) => json.encode(data.toJson());

class TotalOrdersModel {
  TotalOrdersModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<OrderData> data;

  factory TotalOrdersModel.fromJson(Map<String, dynamic> json) => TotalOrdersModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: List<OrderData>.from(json["data"].map((x) => OrderData.fromJson(x ?? {})) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrderData {
  OrderData({
    required this.orderId,
    required this.totalprice,
    required this.totalqty,
    required this.couponid,
    required this.coupontype,
    required this.couponvalue,
    required this.couponprice,
    required this.userFname,
    required this.userLname,
    required this.userCompanyname,
    required this.userCountryId,
    required this.userStreetAddress,
    required this.userCity,
    required this.usersState,
    required this.userPhone,
    required this.userEmail,
    required this.userOrderNote,
    required this.orderType,
    required this.image,
    required this.status,
    required this.orderPdf,
    required this.filepath,
    required this.userId,
    required this.createdDate,
    required this.updatedDate,
  });

  int orderId;
  String totalprice;
  String totalqty;
  String couponid;
  String coupontype;
  String couponvalue;
  String couponprice;
  String userFname;
  String userLname;
  String userCompanyname;
  int userCountryId;
  String userStreetAddress;
  String userCity;
  String usersState;
  String userPhone;
  String userEmail;
  String userOrderNote;
  String orderType;
  String image;
  int status;
  String orderPdf;
  String filepath;
  int userId;
  String createdDate;
  String updatedDate;

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    orderId: json["orderId"] ?? 0,
    totalprice: json["totalprice"] ?? "",
    totalqty: json["totalqty"] ?? "",
    couponid: json["couponid"] ?? "",
    coupontype: json["coupontype"] ?? "",
    couponvalue: json["couponvalue"] ?? "",
    couponprice: json["couponprice"] ?? "",
    userFname: json["userFname"] ?? "",
    userLname: json["userLname"] ?? "",
    userCompanyname: json["userCompanyname"] ?? "",
    userCountryId: json["userCountry_id"] ?? 0,
    userStreetAddress: json["userStreet_address"] ?? "",
    userCity: json["userCity"] ?? "",
    usersState: json["usersState"] ?? "",
    userPhone: json["userPhone"] ?? "",
    userEmail: json["userEmail"] ?? "",
    userOrderNote: json["userOrderNote"] ?? "",
    orderType: json["order_type"] ?? "",
    image: json["image"] ?? "",
    status: json["status"] ?? 0,
    orderPdf: json["order_pdf"] ?? "",
    filepath: json["filepath"] ?? "",
    userId: json["userId"] ?? 0,
    createdDate: json["created_date"] ?? "",
    updatedDate: json["updated_date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "totalprice": totalprice,
    "totalqty": totalqty,
    "couponid": couponid,
    "coupontype": coupontype,
    "couponvalue": couponvalue,
    "couponprice": couponprice,
    "userFname": userFname,
    "userLname": userLname,
    "userCompanyname": userCompanyname,
    "userCountry_id": userCountryId,
    "userStreet_address": userStreetAddress,
    "userCity": userCity,
    "usersState": usersState,
    "userPhone": userPhone,
    "userEmail": userEmail,
    "userOrderNote": userOrderNote,
    "order_type": orderType,
    "image": image,
    "status": status,
    "order_pdf": orderPdf,
    "filepath": filepath,
    "userId": userId,
    "created_date": createdDate,
    "updated_date": updatedDate,
  };
}
