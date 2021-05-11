import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/models/room_model.dart';

class SingleCityRoomsListTiles2 extends StatelessWidget {
  final String imageUrl, placeName, roomdesc;
  final RoomModel room;

  const SingleCityRoomsListTiles2(
      {Key key, this.imageUrl, this.placeName, this.roomdesc, this.room})
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
                    "House Name/No. :  ${room.roomName}",
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
                          "Adress : ${room.address}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "pin : ${room.mno}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "phone no. : ${room.mno}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "Rent: ${room.mno}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "Distance From Market: ${room.mno} km",
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
              child: Image.network(room.imagePath),
            )
          ],
        ),
      ),
    );
  }
}
