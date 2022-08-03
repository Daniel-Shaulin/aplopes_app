

import 'package:flutter/material.dart';

abstract class CustomColors {
  static const _colorPrimary = 0xFF323c4e;

  static const MaterialColor aplopesBasicColor = MaterialColor(
    _colorPrimary,
     <int, Color>{
      50:  Color.fromRGBO(50, 60, 78, .1),
      100: Color.fromRGBO(50, 60, 78, .2),
      200: Color.fromRGBO(50, 60, 78, .3),
      300: Color.fromRGBO(50, 60, 78, .4),
      400: Color.fromRGBO(50, 60, 78, .5),
      500: Color.fromRGBO(50, 60, 78, .6),
      600: Color.fromRGBO(50, 60, 78, .7),
      700: Color.fromRGBO(50, 60, 78, .8),
      800: Color.fromRGBO(50, 60, 78, .9),
      900: Color.fromRGBO(50, 60, 78, .10),
    },
  );
}