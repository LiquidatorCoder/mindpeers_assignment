import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mindpeers/utils/common/functs.dart';

/// Get a random color
Color getRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
String colorToHex(Color color, {bool leadingHashSign = false}) {
  final r = color.red;
  final g = color.green;
  final b = color.blue;
  final a = color.alpha;

  return '${leadingHashSign ? '#' : ''}'
      '${a.toRadixString(16).padLeft(2, '0')}'
      '${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
}

int colorToInt(String hexColor) {
  var newHexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (newHexColor.length == 6) {
    newHexColor = 'FF$newHexColor';
  }

  return int.parse(newHexColor, radix: 16);
}

MaterialColor hexColor2MaterialColor({Color? color, int? hexColor}) {
  assert(isNotNull(color) || isNotNull(hexColor));

  final newColor = color ?? Color(hexColor!);
  final newHexColor = hexColor ?? colorToInt(colorToHex(newColor));

  final r = newColor.red;
  final g = newColor.green;
  final b = newColor.blue;

  return MaterialColor(
    newHexColor,
    <int, Color>{
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    },
  );
}
