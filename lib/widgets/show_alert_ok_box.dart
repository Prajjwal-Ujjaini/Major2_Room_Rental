import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/style.dart';

Future<void> showAlertOkBox(BuildContext context, String message) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("ok", style: navBarItemTextStyle),
          ),
        ],
        content: Row(
          children: [
            Text("$message"),
          ],
        ),
      );
    },
  );
}
