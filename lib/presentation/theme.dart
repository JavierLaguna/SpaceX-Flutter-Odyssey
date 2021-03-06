import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceXColors {
  static final black = Color(0xFF000000);
  static final white = Color(0xFFFFFFFF); // Icons

  static final red = Color(0xFFdc3545);
  static final green = const Color(0xFF28a745);
  static final blue = const Color(0xFF17a2b8);
  static final yellow = const Color(0xFFffc107);

  static final lightOrange = Color(0xFFFFCCBC);
  static final orange = Color(0xFFFF5722); // Primary
  static final darkOrange = Color(0xFFE64A19);

  static final lightGray = Color(0xFFBDBDBD); // Divider
  static final gray = Color(0xFF757575); // Secondary text
  static final darkGray = Color(0xFF212121); // Primary text
  static final darkGray2 = Color(0xFF323232);

  static final blueGray = Color(0xFF607D8B); // Accent
  static final darkBlueGray = Color(0xFF263238);
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
  accentColor: SpaceXColors.blueGray,
  toggleableActiveColor: SpaceXColors.orange,
  textTheme: _lightTextTheme,
  appBarTheme: AppBarTheme(
    color: SpaceXColors.orange,
    textTheme: _lightTextTheme.copyWith(
      headline6: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: SpaceXColors.white,
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: SpaceXColors.orange,
    unselectedItemColor: SpaceXColors.blueGray,
  ),
);

final spaceXDarkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: SpaceXColors.darkOrange,
  toggleableActiveColor: SpaceXColors.darkOrange,
  textTheme: _darkTextTheme,
  appBarTheme: AppBarTheme(
    color: SpaceXColors.darkOrange,
    iconTheme: IconThemeData(
      color: SpaceXColors.darkGray,
    ),
    textTheme: _darkTextTheme.copyWith(
      headline6: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: SpaceXColors.darkGray,
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: SpaceXColors.darkOrange,
    unselectedItemColor: SpaceXColors.lightGray,
    backgroundColor: SpaceXColors.darkBlueGray,
  ),
  backgroundColor: SpaceXColors.darkGray,
  scaffoldBackgroundColor: SpaceXColors.darkGray,
  cardTheme: CardTheme(
    color: SpaceXColors.darkGray2,
  ),
);
