int colorToInt(String hexColor) {
  var newHexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (newHexColor.length == 6) {
    newHexColor = 'FF$newHexColor';
  }

  return int.parse(newHexColor, radix: 16);
}
