import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/image_url.dart';

class FeaturedTiles extends StatelessWidget {
  final Size screenSize;

  FeaturedTiles({Key key, this.screenSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...Iterable<int>.generate(assets.length).map(
            (int pageIndex) => Column(
              children: [
                SizedBox(
                  height: screenSize.width / 6,
                  width: screenSize.width / 3.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      assets[pageIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height / 70,
                  ),
                  child: Text(
                    title[pageIndex],
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryTextTheme.subtitle1.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
