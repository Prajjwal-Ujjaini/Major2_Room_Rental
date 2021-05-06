import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/Constants/theme_data.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/home_new.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainModel mainModel = MainModel();

  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print("started init \n\n uid== $uid \n\n email== $userEmail");

    print(" main page pr authSignedInkey  == $checkAuthSignedInkey");
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    mainModel.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        title: 'Room Rentel',
        theme: lightThemeData, //ThemeData(primarySwatch: Colors.blue),
        darkTheme: darkThemeData,
        home: HomeNew(model: mainModel),
      ),
    );
  }
}
