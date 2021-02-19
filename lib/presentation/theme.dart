import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceXColors {
  static final orange = Color(0xFFFF5722);
  static final darkOrange = Color(0xFFE64A19);
  static final lightOrange = Color(0xFFFFCCBC);

  static final accent = Color(0xFF607D8B);

  static final primaryText = Color(0xFF212121);
  static final secondaryText = Color(0xFF757575);

  static final icons = Color(0xFFFFFFFF);
  static final divider = Color(0xFFBDBDBD);

  static final black = Color(0xFF000000);
  static final white = Color(0xFFFFFFFF);
}

final spaceXLightTheme = ThemeData(
    textTheme: GoogleFonts.ralewayTextTheme().apply(
        bodyColor: SpaceXColors.primaryText,
        displayColor: SpaceXColors.primaryText));
