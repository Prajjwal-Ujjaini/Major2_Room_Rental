import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showtoast(String error) {
  Fluttertoast.showToast(
      msg: 'Registration Error: $error',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.yellow);
}
