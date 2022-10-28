import 'package:flutter/widgets.dart';
import 'package:mindpeers/utils/common/colors.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(colorToInt(hexColor));
}
