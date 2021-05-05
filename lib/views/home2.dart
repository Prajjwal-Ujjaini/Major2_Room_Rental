// import 'package:flutter/material.dart';
// import 'package:major2_demo_room_rental/Constants/image_url.dart';
// import 'package:major2_demo_room_rental/widgets/centered_view/centered_view.dart';
// import 'package:major2_demo_room_rental/widgets/navigation_bar/navigation_bar.dart';

// class LayoutTemplate extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(backgroundIamgeUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: CenteredView(
//             child: Container(
//               color: Colors.white38,
//               child: Column(
//                 children: <Widget>[
//                   NavigationBar(),
//                   Expanded(child: Navigator()),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:major2_demo_room_rental/Constants/image_url.dart';
// import 'package:major2_demo_room_rental/views/auto_slider.dart';
// import 'package:major2_demo_room_rental/widgets/centered_view/centered_view.dart';

// class HomeView2 extends StatelessWidget {
//   const HomeView2({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,

//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(backgroundIamgeUrl),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.circular(5),
//         border: Border.all(color: Colors.grey[300]),
//       ),
//       child: Text("Hii"),
//       // child: CenteredView(
//       //   child: AutoSlider(),
//       // ),
//     );
//   }
// }
