import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String btnText;

  const SmallButton({this.btnText});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 70.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(color: Colors.blue, fontSize: 16.0),
        ),
      ),
    );
  }
}
