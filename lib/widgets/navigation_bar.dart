import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/Constants/style.dart';
import 'package:major2_room_rental/views/about_page.dart';
import 'package:major2_room_rental/views/admin/add_rooms.dart';
import 'package:major2_room_rental/views/admin/admin_page.dart';
import 'package:major2_room_rental/views/home_new.dart';
import 'package:major2_room_rental/views/profile_page.dart';
import 'package:major2_room_rental/widgets/auth_dailog.dart';
import 'package:major2_room_rental/widgets/navbar_item.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => HomeNew()));
            },
            child: Text(
              "Room Rental",
              style: appNameTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem(
                title: 'Home',
                navigatorPath: HomeNew(),
              ),
              SizedBox(width: 60),
              GestureDetector(
                onTap: () {
                  if (checkAuthSignedInkey) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage()));
                  } else {
                    AuthDialog(context);
                  }
                },
                child: Text(checkAuthSignedInkey ? "Profile" : "SignUp",
                    style: navBarItemTextStyle),
              ),
              SizedBox(width: 60),
              NavBarItem(
                title: 'About',
                navigatorPath: AboutPage(),
              ),
              SizedBox(width: 60),
              NavBarItem(
                title: 'Admin',
                navigatorPath: AddRooms(),
              ),
              SizedBox(width: 30),
            ],
          )
        ],
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white54,
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(color: Colors.grey[300]),
      // ),
    );
  }
}
