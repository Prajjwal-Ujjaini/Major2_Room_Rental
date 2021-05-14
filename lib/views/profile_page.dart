import 'dart:math';

import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/admin/add_rooms.dart';
import 'package:major2_room_rental/views/home_new.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/centered_view.dart';
import 'package:major2_room_rental/widgets/custom_button.dart';
import 'package:major2_room_rental/widgets/custom_list_tile.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';
import 'package:major2_room_rental/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var random;
  int tmpImageIndex;

  @override
  void initState() {
    super.initState();
    random = new Random();
    tmpImageIndex = random.nextInt(imageUrlListAll.length);
  }

  bool turnOnNotification = false;
  bool turnOnLocation = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              decoration: backgroundMainDecoration,
              child: Column(
                children: [
                  NavigationBar(),
                  CenteredView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "User Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3.0,
                                      offset: Offset(0, 4.0),
                                      color: Colors.black38),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      imageUrlListAll[tmpImageIndex]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                      "UserName : ",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    Text(
                                      "${authencatedUserInfo.username}",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "User Email: ",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    Text(
                                      "${authencatedUserInfo.email}",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await signOut().then((result) {
                                      print(result);

                                      setState(() {
                                        checkAuthSignedInkey = false;
                                      });
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  HomeNew()));
                                    }).catchError((error) {
                                      print('Sign Out Error: $error');
                                    });
                                  },
                                  child: SmallButton(
                                    btnText: "Log Out",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "General",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
                          elevation: 3.0,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                CustomButton(
                                  icon: Icons.add_business,
                                  text: "Add Rooms",
                                  path: AddRooms(),
                                ),
                                // Divider(
                                //   height: 10.0,
                                //   color: Colors.grey,
                                // ),
                                // CustomButton(
                                //   icon: Icons.account_box,
                                //   text: "Update Profile",
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Account Information",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
                          elevation: 3.0,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                // CustomListTile(
                                //   icon: Icons.phone_android,
                                //   text:
                                //       "Contact Number : ${authencatedUserInfo.phoneNumber != null ? authencatedUserInfo.phoneNumber : "Please Update your Phone No."}",
                                // ),
                                // Divider(
                                //   height: 10.0,
                                //   color: Colors.grey,
                                // ),
                                // CustomListTile(
                                //   icon: Icons.person,
                                //   text: "Gender: ${authencatedUserInfo.p != null ? authencatedUserInfo.phoneNumber : "Please Update your Phone No."}",
                                // ),
                                // Divider(
                                //   height: 10.0,
                                //   color: Colors.grey,
                                // ),
                                CustomListTile(
                                  icon: Icons.account_box,
                                  text:
                                      "Account Type : ${authencatedUserInfo.userType}",
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
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
      },
    );
  }
}
