import 'package:flutter/cupertino.dart';
import 'package:major2_room_rental/Constants/image_url.dart';

BoxDecoration backgroundMainDecoration = BoxDecoration(
  image: DecorationImage(
    image: NetworkImage(backgroundIamgeUrl),
    fit: BoxFit.cover,
  ),
);
