import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/Constants/style.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/centered_view.dart';
import 'package:major2_room_rental/widgets/featured_heading.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              SizedBox(height: 15),
              FeaturedHeading(
                  screenSize: screenSize, title: "Design And Developed By"),
              CenteredView(
                child: Center(
                  child: Container(
                    height: screenSize.height / 2,
                    color: Colors.white70,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: screenSize.height / 2.5,
                            width: screenSize.height / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: screenSize.height / 5,
                                  width: screenSize.height / 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3.0,
                                          offset: Offset(0, 4.0),
                                          color: Colors.black38),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/ashish.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    Text("Ashish Parlani",
                                        style: navBarItemTextStyle),
                                    SizedBox(height: 12),
                                    Text("aashishparlani000@gmail.com",
                                        style: navBarItemTextStyle),
                                    SizedBox(height: 12),
                                    Text("8717876843",
                                        style: navBarItemTextStyle)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: screenSize.height / 2.5,
                            width: screenSize.height / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: screenSize.height / 5,
                                  width: screenSize.height / 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3.0,
                                          offset: Offset(0, 4.0),
                                          color: Colors.black38),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/prajjwal.jpeg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    Text("Prajjwal Ujjaini",
                                        style: navBarItemTextStyle),
                                    SizedBox(height: 12),
                                    Text("prajjwalujjaini@gmail.com",
                                        style: navBarItemTextStyle),
                                    SizedBox(height: 12),
                                    Text("7415968218",
                                        style: navBarItemTextStyle)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
