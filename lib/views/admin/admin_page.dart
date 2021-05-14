import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/views/admin/add_rooms.dart';
import 'package:major2_room_rental/views/profile_page.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/gernral_tile_card.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: backgroundMainDecoration,
          child: Column(
            children: [
              NavigationBar(),
              SizedBox(height: 30),
              Container(
                height: screenSize.height / 2,
                width: screenSize.width,
                child: Column(
                  children: [
                    Text(
                      "Admin DashBoard",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GeneralTileCard(
                            screenSize,
                            titleName: "Add Room",
                            path: AddRooms(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GeneralTileCard(
                            screenSize,
                            titleName: "View Profile",
                            path: ProfilePage(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
