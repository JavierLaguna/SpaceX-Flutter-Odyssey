import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceXColors {
  static final black = Color(0xFF000000);
  static final white = Color(0xFFFFFFFF);

  static final lightOrange = Color(0xFFFFCCBC);
  static final orange = Color(0xFFFF5722);
  static final darkOrange = Color(0xFFE64A19);

  static final lightGray = Color(0xFFBDBDBD);
  static final gray = Color(0xFF757575);
  static final darkGray = Color(0xFF212121);
  static final blueGray = Color(0xFF607D8B);
}

final spaceXLightTheme = ThemeData(
    textTheme: GoogleFonts.ralewayTextTheme().apply(
        bodyColor: SpaceXColors.darkGray,
        displayColor: SpaceXColors.darkGray));
