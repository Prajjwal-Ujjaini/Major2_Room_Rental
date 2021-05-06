import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/Constants/image_url.dart';

class SingleCityRoomsListTiles2 extends StatelessWidget {
  final String imageUrl, placeName, roomdesc;

  const SingleCityRoomsListTiles2(
      {Key key, this.imageUrl, this.placeName, this.roomdesc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width / 2.5,
        height: screenSize.width / 6,
        decoration: gradentDecoration,
        // decoration: backgroundMainDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ghar ka naam aayega  $placeName",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Adress denge $roomdesc",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "phone number",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "owner rating",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 310,
              child: Image.network(
                homeImageUrl,
              ),
            )
          ],
        ),
      ),
    );
  }
}
