import 'package:flutter/material.dart';

class CenterView extends StatefulWidget {
  const CenterView({Key key}) : super(key: key);

  @override
  _CenterViewState createState() => _CenterViewState();
}

class _CenterViewState extends State<CenterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      // color: Colors.white38,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          // Text(
          //   'Room Rental',
          //   style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 50,
          //       fontStyle: FontStyle.italic,
          //       fontWeight: FontWeight.bold),
          //   textAlign: TextAlign.center,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }
}
