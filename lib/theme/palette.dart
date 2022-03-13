import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor myMaroon = MaterialColor(
    0xffb12341, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffb12341 ),//10%
      100: Color(0xff9f203b),//20%
      200: Color(0xff8e1c34),//30%
      300: Color(0xff7c192e),//40%
      400: Color(0xff6a1527),//50%
      500: Color(0xff470e1a),//60%
      600: Color(0xff350a13),//70%
      700: Color(0xff23070d),//80%
      800: Color(0xff120306),//90%
      900: Color(0xff000000),//100%
    },
  );
  static const MaterialColor myAmber = MaterialColor(
    0xfffdce84, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfffdce84 ),//10%
      100: Color(0xffe4b977),//20%
      200: Color(0xffcaa56a),//30%
      300: Color(0xffb1905c),//40%
      400: Color(0xff987c4f),//50%
      500: Color(0xff7f6742),//60%
      600: Color(0xff655235),//70%
      700: Color(0xff4c3e28),//80%
      800: Color(0xff19150d),//90%
      900: Color(0xff000000),//100%
    },
  );
  static const MaterialColor mySky = MaterialColor(
    0xff99d5f3, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff99d5f3 ),//10%
      100: Color(0xff8ac0db),//20%
      200: Color(0xff7aaac2),//30%
      300: Color(0xff6b95aa),//40%
      400: Color(0xff5c8092),//50%
      500: Color(0xff4d6b7a),//60%
      600: Color(0xff3d5561),//70%
      700: Color(0xff2e4049),//80%
      800: Color(0xff0f1518),//90%
      900: Color(0xff0f1518),//100%
    },
  );
}