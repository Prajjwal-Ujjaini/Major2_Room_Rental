import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/views/admin/add_rooms.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/centered_view.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: backgroundMainDecoration,
          child: Column(
            children: [
              NavigationBar(),
              SizedBox(height: 30),
              Container(
                child: AddRooms(),
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
