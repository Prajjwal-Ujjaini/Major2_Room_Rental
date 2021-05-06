import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/style.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  final Widget navigatorPath;

  NavBarItem({
    this.title,
    this.navigatorPath,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => widget.navigatorPath));
      },
      child: Text(widget.title, style: navBarItemTextStyle),
    );
  }
}
