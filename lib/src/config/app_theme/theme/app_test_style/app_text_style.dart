import 'package:flutter/material.dart';

class AppTextStyle {
  final TextStyle display1;
  final TextStyle display2;
  final TextStyle display3;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle subheading;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle caption;

  AppTextStyle({
    this.body1 = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 12.64,
      color: Colors.white,
    ),
    this.body2 = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 14.22,
      color: Colors.white,
    ),
    this.caption = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 11.24,
      color: Colors.white,
    ),
    this.display1 = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 22.78,
      color: Colors.white,
    ),
    this.display2 = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 25.63,
      color: Colors.white,
    ),
    this.display3 = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 28.83,
      color: Colors.white,
    ),
    this.headline = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 12.64,
      color: Colors.white,
    ),
    this.subheading = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 16,
      color: Colors.white,
    ),
    this.title = const TextStyle(
      fontFamily: "Outfit-Regular",
      fontSize: 18,
      color: Colors.white,
    ),
  });
}
