import 'package:flutter/material.dart';
import 'package:getflutter/components/search_bar/gf_search_bar.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/views/city_rooms_list.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // String _selectedItemText = "Your Selected City";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 95,
      child: Column(
        children: <Widget>[
          // SizedBox(height: 20),
          // Text(
          //   _selectedItemText,
          // ),
          // SizedBox(height: 20),
          GFSearchBar(
            searchList: citiesName,
            searchQueryBuilder: (query, list) {
              return list
                  .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            overlaySearchListItemBuilder: (item) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
            onItemSelected: (item) {
              setState(() {
                // _selectedItemText = item;
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CityRoomsList(
                          cityString: item,
                        )));
              });
            },
            overlaySearchListHeight: 40,
          ),
        ],
      ),
    );
  }
}
