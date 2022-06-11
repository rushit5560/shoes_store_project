import 'package:flutter/material.dart';

InputDecoration formInputDecoration({String? hintText, double? radius}) {
  return InputDecoration(
    hintText: "$hintText",
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
        borderSide: BorderSide(color: Colors.grey)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
        borderSide: BorderSide(color: Colors.grey)
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
        borderSide: BorderSide(color: Colors.grey)
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 30)),
        borderSide: BorderSide(color: Colors.grey)
    ),
  );
}