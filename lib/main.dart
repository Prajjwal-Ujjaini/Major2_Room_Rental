import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/Constants/theme_data.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/layout_template/layout_template_final_2.dart';
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
    print(uid);

    print(" main page pr authSignedInkey  == $checkAuthSignedInkey");
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        title: 'Room Rentel',
        theme: lightThemeData, //ThemeData(primarySwatch: Colors.blue),
        darkTheme: darkThemeData,
        home: LayoutTemplateFinal2(model: mainModel),
      ),
    );
  }
}
