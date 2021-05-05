import 'package:flutter/material.dart';
import 'package:major2_room_rental/views/center_view.dart';
import 'package:major2_room_rental/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              NavigationBar(),
              CenterView(),
            ],
          ),
        ),
      ),
    );
  }
}
