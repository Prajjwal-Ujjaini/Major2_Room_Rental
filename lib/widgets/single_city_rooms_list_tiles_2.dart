import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/models/room_model.dart';

class SingleCityRoomsListTiles2 extends StatefulWidget {
  // final String imageUrl, placeName, roomdesc;
  final RoomModel room;

  const SingleCityRoomsListTiles2({Key key, this.room}) : super(key: key);

  @override
  _SingleCityRoomsListTiles2State createState() =>
      _SingleCityRoomsListTiles2State();
}

class _SingleCityRoomsListTiles2State extends State<SingleCityRoomsListTiles2> {
  @override
  void initState() {
    super.initState();

    // print("\n\n Tile ka andar  = ${widget.room.roomName}");
  }

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
                    "House Name/No. :  ${widget.room.roomName}",
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
                          "City : ${widget.room.city}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "Adress : ${widget.room.address}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "pin : ${widget.room.pin}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "Owners phone no. : ${widget.room.mno}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "Rent: ${widget.room.rent}",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          "Distance From Market: ${widget.room.distanceFromMarket} km",
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
              child: Image.network(widget.room.imagePath),
            )
          ],
        ),
      ),
    );
  }
}
