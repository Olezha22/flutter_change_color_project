import 'package:flutter/material.dart';

Color getTextColorFromBackground(Color backgroundColor) {
  return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
