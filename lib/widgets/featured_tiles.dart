import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/temporary_data.dart';
import 'package:major2_room_rental/models/category_model.dart';
import 'package:major2_room_rental/widgets/feature_tiles_card.dart';

class FeaturedTiles extends StatefulWidget {
  final Size screenSize;

  FeaturedTiles({Key key, this.screenSize}) : super(key: key);

  @override
  _FeaturedTilesState createState() => _FeaturedTilesState();
}

class _FeaturedTilesState extends State<FeaturedTiles> {
  // ignore: deprecated_member_use
  List<CategoryModel> cities = new List<CategoryModel>();

  @override
  void initState() {
    super.initState();
    cities = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.06,
        left: widget.screenSize.width / 15,
        right: widget.screenSize.width / 15,
      ),
      child: Container(
        child: Container(
          height: widget.screenSize.width / 6,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return FeatureTileCard(
                  widget.screenSize,
                  imageUrl: cities[index].imageUrl,
                  categoryName: cities[index].categoryName,
                );
              }),
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     ...Iterable<int>.generate(assets.length).map(
      //       (int pageIndex) => Column(
      //         children: [
      //           SizedBox(
      //             height: screenSize.width / 6,
      //             width: screenSize.width / 3.8,
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(5.0),
      //               child: Image.network(
      //                 assets[pageIndex],
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(
      //               top: screenSize.height / 70,
      //             ),
      //             child: Text(
      //               title[pageIndex],
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontFamily: 'Montserrat',
      //                 fontWeight: FontWeight.w500,
      //                 color: Theme.of(context).primaryTextTheme.subtitle1.color,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
