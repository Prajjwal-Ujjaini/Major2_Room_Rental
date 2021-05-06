import 'package:flutter/cupertino.dart';
import 'package:major2_room_rental/Constants/image_url.dart';

BoxDecoration backgroundMainDecoration = BoxDecoration(
  image: DecorationImage(
    image: NetworkImage(backgroundIamgeUrl),
    fit: BoxFit.cover,
  ),
);

BoxDecoration gradentDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromRGBO(195, 20, 50, 1.0),
        Color.fromRGBO(36, 11, 54, 1.0)
      ]),
);
