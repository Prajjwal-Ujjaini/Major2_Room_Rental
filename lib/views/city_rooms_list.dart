import 'dart:html';
import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/style.dart';
import 'package:major2_room_rental/models/room_model.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';
import 'package:major2_room_rental/widgets/single_city_rooms_list_tiles_2.dart';
import 'package:scoped_model/scoped_model.dart';

class CityRoomsList extends StatefulWidget {
  final MainModel model;
  final String cityString;

  const CityRoomsList({Key key, this.cityString, this.model}) : super(key: key);

  @override
  _CityRoomsListState createState() => _CityRoomsListState();
}

class _CityRoomsListState extends State<CityRoomsList> {
  // ignore: deprecated_member_use
  // List<CategoryModel> cityRoomList = new List<CategoryModel>();

  Future getData() async {
    // var response =
    // await widget.model.getCityRooms(widget.cityString.toLowerCase());

    // if (response == null) {
    //   showAlertOkBox(
    //       context, "No Data Available for the City ${widget.cityString}");
    // }
  }

  @override
  void initState() {
    super.initState();
    // cityRoomList = getCategories();
    print("\ncity == ${widget.cityString.toLowerCase()}");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              NavigationBar(),
              Container(
                child: Center(
                  child: Text(
                    widget.cityString,
                    style: navBarItemTextStyle,
                  ),
                ),
              ),
              Divider(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ScopedModelDescendant<MainModel>(builder:
                    (BuildContext context, Widget child, MainModel model) {
                  return Column(
                    children: model.rooms.map(_buildRoomItems).toList(),
                  );
                }),
              ),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 70),
              //     child: Container(
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.only(top: 16),
              //       child: ListView.builder(
              //         shrinkWrap: true,
              //         physics: ClampingScrollPhysics(),
              //         itemCount: cityRoomList.length,
              //         itemBuilder: (context, index) {
              //           return SingleCityRoomsListTiles2(
              //             imageUrl: cityRoomList[index].imageUrl,
              //             placeName: cityRoomList[index].categoryName,
              //             roomdesc: cityRoomList[index].categoryName,
              //           );
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomItems(RoomModel room) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 70),
        margin: EdgeInsets.only(bottom: 20.0),
        child: SingleCityRoomsListTiles2(
          // imageUrl: room.imagePath,
          // placeName: room.roomName,
          // roomdesc: room.address,
          room: room,
        ),
      ),
    );
  }
}
