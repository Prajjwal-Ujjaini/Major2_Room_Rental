import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  final String title;
  final Size screenSize;

  const FeaturedHeading({Key key, this.title, this.screenSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
