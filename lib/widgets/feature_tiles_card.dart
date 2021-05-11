import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/city_rooms_list.dart';

class FeatureTileCard extends StatelessWidget {
  final MainModel model;
  final Size screenSize;
  final imageUrl, categoryName;

  const FeatureTileCard(this.screenSize,
      {this.imageUrl, this.categoryName, this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => CityRoomsList(
                  cityString: categoryName,
                  model: model,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: screenSize.width / 6,
                width: screenSize.width / 3.8,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: screenSize.width / 6,
              width: screenSize.width / 3.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
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
