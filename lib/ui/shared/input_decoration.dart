import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecorationForm(String title) {
  return InputDecoration(
    hintText: title,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green),
    ),
  );
}
