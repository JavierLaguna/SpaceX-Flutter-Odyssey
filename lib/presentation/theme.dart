import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceXColors {
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF); // Icons

  static const red = Color(0xFFdc3545);
  static const green = Color(0xFF28a745);
  static const blue = Color(0xFF17a2b8);
  static const yellow = Color(0xFFffc107);

  static const lightOrange = Color(0xFFFFCCBC);
  static const orange = Color(0xFFFF5722); // Primary
  static const darkOrange = Color(0xFFE64A19);

  static const lightGray = Color(0xFFBDBDBD); // Divider
  static const gray = Color(0xFF757575); // Secondary text
  static const darkGray = Color(0xFF212121); // Primary text
  static const darkGray2 = Color(0xFF323232);

  static const blueGray = Color(0xFF607D8B); // Accent
  static const darkBlueGray = Color(0xFF263238);
}

extension CustomColorScheme on ColorScheme {
  Color get success => SpaceXColors.green;

  Color get info => SpaceXColors.blue;

  Color get warning => SpaceXColors.yellow;

  Color get danger => SpaceXColors.red;
}

final _lightTextTheme = GoogleFonts.ralewayTextTheme().apply(
  bodyColor: SpaceXColors.darkGray,
  displayColor: SpaceXColors.darkGray,
);

final _darkTextTheme = GoogleFonts.ralewayTextTheme().apply(
  bodyColor: SpaceXColors.white,
  displayColor: SpaceXColors.white,
);
final spaceXLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: SpaceXColors.orange,
    secondary: SpaceXColors.blueGray,
  ),
  textTheme: _lightTextTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: SpaceXColors.orange,
    titleTextStyle: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: SpaceXColors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: SpaceXColors.orange,
    unselectedItemColor: SpaceXColors.blueGray,
  ),
  bottomAppBarTheme: const BottomAppBarThemeData(
    color: SpaceXColors.darkGray2,
  ),
);

final spaceXDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: SpaceXColors.darkOrange,
    secondary: SpaceXColors.darkOrange,
  ),
  textTheme: _darkTextTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: SpaceXColors.darkOrange,
    iconTheme: IconThemeData(
      color: SpaceXColors.darkGray,
    ),
    titleTextStyle: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: SpaceXColors.darkGray,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: SpaceXColors.darkOrange,
    unselectedItemColor: SpaceXColors.lightGray,
    backgroundColor: SpaceXColors.darkBlueGray,
  ),
  scaffoldBackgroundColor: SpaceXColors.darkGray,
  cardTheme: const CardThemeData(
    color: SpaceXColors.darkGray2,
  ),
  bottomAppBarTheme: const BottomAppBarThemeData(
    color: SpaceXColors.white,
  ),
);