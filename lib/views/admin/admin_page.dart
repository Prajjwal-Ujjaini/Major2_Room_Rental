import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/navigation_bar/navigation_bar.dart';

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
          height: MediaQuery.of(context).size.height,
          decoration: backgroundMainDecoration,
          child: Column(
            children: [
              NavigationBar(),
              SizedBox(height: 30),
              Center(child: Container(height: 360, color: Colors.amberAccent)),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
