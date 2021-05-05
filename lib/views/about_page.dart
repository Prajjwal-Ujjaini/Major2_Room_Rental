import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/Constants/style.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/views/layout_template/layout_template_final_2.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/navigation_bar/navigation_bar.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              Center(
                child: Container(
                  height: 360,
                  color: Colors.white70,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        await signOut().then((result) {
                          print(result);

                          setState(() {
                            checkAuthSignedInkey = false;
                          });
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LayoutTemplateFinal2()));
                        }).catchError((error) {
                          print('Sign Out Error: $error');
                        });
                      },
                      child: Text(
                        "Sign Out",
                        style: navBarItemTextStyle,
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
