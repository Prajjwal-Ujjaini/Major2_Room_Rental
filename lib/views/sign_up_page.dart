import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/views/dailogs/sign_up_dailog.dart';
import 'package:major2_room_rental/views/dailogs/sign_up_dailog_2.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: backgroundMainDecoration,
          child: Center(
            child: Column(
              children: [
                NavigationBar(),
                SignUpDailog(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
