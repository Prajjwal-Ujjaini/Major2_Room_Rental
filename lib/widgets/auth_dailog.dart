import 'package:flutter/material.dart';
import 'package:major2_room_rental/widgets/auth_dailog2.dart';

Future<void> AuthDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AuthDailog2();
    },
  );
}
