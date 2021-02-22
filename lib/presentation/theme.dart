import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceXColors {
  static final black = Color(0xFF000000);
  static final white = Color(0xFFFFFFFF); // Icons

  static final lightOrange = Color(0xFFFFCCBC);
  static final orange = Color(0xFFFF5722); // Primary
  static final darkOrange = Color(0xFFE64A19);

  static final lightGray = Color(0xFFBDBDBD); // Divider
  static final gray = Color(0xFF757575); // Secondary text
  static final darkGray = Color(0xFF212121); // Primary text
  static final blueGray = Color(0xFF607D8B); // Accent
}

final spaceXLightTheme = ThemeData(
  accentColor: SpaceXColors.blueGray,
  toggleableActiveColor: SpaceXColors.orange,
  textTheme: GoogleFonts.ralewayTextTheme().apply(
    bodyColor: SpaceXColors.darkGray,
    displayColor: SpaceXColors.darkGray,
  ),
  appBarTheme: AppBarTheme(
    color: SpaceXColors.orange,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: SpaceXColors.orange,
    unselectedItemColor: SpaceXColors.blueGray
  ),
);
