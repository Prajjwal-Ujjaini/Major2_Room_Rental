import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/views/auto_slider.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/featured_heading.dart';
import 'package:major2_room_rental/widgets/featured_tiles.dart';
import 'package:major2_room_rental/widgets/floating_quick_access_bar.dart';
import 'package:major2_room_rental/widgets/navigation_bar/navigation_bar.dart';

class HomeNew extends StatefulWidget {
  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          // decoration: backgroundMainDecoration,
          child: Column(
            children: [
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
                                title: "Featured", screenSize: screenSize),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              FeaturedHeading(title: "Rating", screenSize: screenSize),
              AutoSlider(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
