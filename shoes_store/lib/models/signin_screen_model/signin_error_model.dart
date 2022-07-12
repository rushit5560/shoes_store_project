import 'dart:convert';

SignInErrorModel signInErrorModelFromJson(String str) => SignInErrorModel.fromJson(json.decode(str));

String signInErrorModelToJson(SignInErrorModel data) => json.encode(data.toJson());

class SignInErrorModel {
  SignInErrorModel({
    required this.success,
    required this.error,
  });

  bool success;
  String error;

  factory SignInErrorModel.fromJson(Map<String, dynamic> json) => SignInErrorModel(
    success: json["success"] ?? false,
    error: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}
