import 'package:flutter/material.dart';
import 'package:major2_room_rental/widgets/search_bar.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  final Size screenSize;

  const FloatingQuickAccessBar({this.screenSize});

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['Destination', 'Dates', 'People', 'Experience'];
  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
            color: _isHovering[i]
                ? Theme.of(context).primaryTextTheme.button.decorationColor
                : Theme.of(context).primaryTextTheme.button.color,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.screenSize.height * 0.40,
            left: widget.screenSize.width / 5,
            right: widget.screenSize.width / 5),
        child: Card(
          elevation: 5,
          child: Padding(
              padding: EdgeInsets.only(
                top: widget.screenSize.height / 50,
                bottom: widget.screenSize.height / 50,
              ),
              child: SearchBar()),
        ),
      ),
    );
  }
}
