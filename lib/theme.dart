import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.purple,
      brightness: Brightness.light);

  static final dark = ThemeData(
      backgroundColor: Colors.black87,
      primaryColor: Colors.black87,
      brightness: Brightness.dark);
}

TextStyle get subHeading {
  return const TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
}

TextStyle get heading {
  return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}

TextStyle get titletask {
  return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle get calendar {
  return const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}
