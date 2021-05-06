import 'package:flutter/material.dart';

class SingleCityRoomsListTiles extends StatelessWidget {
  final String imageUrl, placeName, roomdesc;

  const SingleCityRoomsListTiles(
      {Key key, this.imageUrl, this.placeName, this.roomdesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              height: screenSize.width / 6,
              width: screenSize.width / 3.8,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: screenSize.width / 6,
            width: screenSize.width / 3.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: Container(
              color: Colors.white30,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    placeName,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    roomdesc,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
