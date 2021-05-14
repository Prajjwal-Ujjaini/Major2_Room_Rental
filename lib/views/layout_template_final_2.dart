// import 'package:flutter/material.dart';
// import 'package:major2_room_rental/Constants/decorations.dart';
// import 'package:major2_room_rental/scoped_model/main_model.dart';
// import 'package:major2_room_rental/widgets/navigation_bar.dart';
// import 'package:major2_room_rental/widgets/single_city_rooms_list_tiles_2.dart';

// class LayoutTemplateFinal2 extends StatefulWidget {
//   final MainModel model;

//   const LayoutTemplateFinal2({this.model});

//   @override
//   _LayoutTemplateFinal2State createState() => _LayoutTemplateFinal2State();
// }

// class _LayoutTemplateFinal2State extends State<LayoutTemplateFinal2> {
//   @override
//   void initState() {
//     super.initState();
//     // widget.model.fetchAll();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           // decoration: backgroundMainDecoration,
//           // decoration: gradentDecoration,
//           child: Column(
//             children: <Widget>[
//               NavigationBar(),
//               SizedBox(height: 30),
//               Container(
//                 width: 1000,
//                 height: 600,
//                 // decoration: gradentDecoration,
//                 decoration: backgroundMainDecoration,
//                 child: Center(
//                   child: SingleCityRoomsListTiles2(),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
