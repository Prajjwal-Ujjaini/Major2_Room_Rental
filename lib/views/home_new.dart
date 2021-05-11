import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/auto_slider.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/featured_heading.dart';
import 'package:major2_room_rental/widgets/featured_tiles.dart';
import 'package:major2_room_rental/widgets/floating_quick_access_bar.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';

class HomeNew extends StatefulWidget {
  final MainModel model;

  const HomeNew({this.model});

  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  @override
  void initState() {
    super.initState();
    // print("user id in home ka andar == $firebaseAuthId");
    // widget.model.fetchAll();
    // widget.model.signUpWithEmailPasswordWithApi(email, password, userInfo)
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          // decoration: backgroundMainDecoration,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.45,
                      width: screenSize.width,
                      child: Image.network(
                        homeImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  NavigationBar(),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      Container(
                        child: Column(
                          children: [
                            FeaturedHeading(
                                title: "Cities", screenSize: screenSize),
                            FeaturedTiles(
                              screenSize: screenSize,
                              model: widget.model,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              FeaturedHeading(title: "Featured", screenSize: screenSize),
              AutoSlider(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
