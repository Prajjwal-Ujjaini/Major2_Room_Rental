import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/image_url.dart';

class GeneralTileCard extends StatefulWidget {
  final Size screenSize;
  final titleName;
  final Widget path;

  const GeneralTileCard(this.screenSize, {this.titleName, this.path});

  @override
  _GeneralTileCardState createState() => _GeneralTileCardState();
}

class _GeneralTileCardState extends State<GeneralTileCard> {
  var random;
  int tmpImageIndex;

  @override
  void initState() {
    super.initState();
    random = new Random();
    tmpImageIndex = random.nextInt(imageUrlListAll.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => widget.path));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrlListAll[tmpImageIndex],
                height: widget.screenSize.width / 6,
                width: widget.screenSize.width / 3.8,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: widget.screenSize.width / 6,
              width: widget.screenSize.width / 3.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                widget.titleName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
