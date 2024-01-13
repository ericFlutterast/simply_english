import 'package:flutter/material.dart';

class AppColors {
  final StatusColor status;
  final AccentColor accent;
  final GrayscaleColor grayscale;

  const AppColors({
    required this.accent,
    required this.grayscale,
    required this.status,
  });
}

class StatusColor {
  final Color error;
  final Color errorMuted;
  final Color success;
  final Color successMuted;

  StatusColor(
      {this.error = const Color(0xFFC02828),
      this.errorMuted = const Color(0xFFC02828),
      this.success = const Color(0xFF288F45),
      this.successMuted = const Color(0xFF288F45)});
}

class AccentColor {
  final Color primary;
  final Color primaryMuted;
  final Color secondary;
  final Color secondaryMuted;

  AccentColor({
    this.primary = const Color(0xFF0085FF),
    this.primaryMuted = const Color(0xFF143D63),
    this.secondary = const Color(0xFFFFA800),
    this.secondaryMuted = const Color(0xFF754D00),
  });
}

class GrayscaleColor {
  final Color g0;
  final Color g1;
  final Color g2;
  final Color g3;
  final Color g4;
  final Color g5;
  final Color g6;

  GrayscaleColor({
    this.g0 = const Color(0xFF1B1B1E),
    this.g1 = const Color(0xFF1F1F25),
    this.g2 = const Color(0xFF212127),
    this.g3 = const Color(0xFF25262E),
    this.g4 = const Color(0xFF2B2C35),
    this.g5 = const Color(0xFF5B5D6D),
    this.g6 = const Color(0xFFFFFFFF),
  });
}
