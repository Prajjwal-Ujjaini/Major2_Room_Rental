import 'package:flutter/material.dart';
import 'package:major2_room_rental/views/about_page.dart';
import 'package:major2_room_rental/widgets/bottom_bar_column.dart';
import 'package:major2_room_rental/widgets/info_text.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => AboutPage()));
                },
                child: BottomBarColumn(
                  heading: 'ABOUT',
                  s1: 'Contact Us',
                  s2: 'About Us',
                  s3: 'Careers',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => AboutPage()));
                },
                child: BottomBarColumn(
                  heading: 'HELP',
                  s1: 'Payment',
                  s2: 'Cancellation',
                  s3: 'FAQ',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => AboutPage()));
                },
                child: BottomBarColumn(
                  heading: 'SOCIAL',
                  s1: 'Twitter',
                  s2: 'Facebook',
                  s3: 'YouTube',
                ),
              ),
              Container(
                color: Colors.blueGrey,
                width: 2,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(
                    type: 'Email',
                    text: 'major2roomrental@gmail.com',
                  ),
                  SizedBox(height: 5),
                  InfoText(
                    type: 'Address',
                    text:
                        'SISTec Gandhi Nagar Campus,Opposite International Airport, Bhopal (M.P.) 462036',
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Copyright © 2021 | Major 2 Room Rental',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
