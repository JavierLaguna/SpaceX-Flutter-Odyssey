import 'package:SpaceXFlutterOdyssey/core/utils/enum_from_string.dart';
import 'package:SpaceXFlutterOdyssey/domain/entities/spacex_theme.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryLocalImpl extends PreferencesRepositoryLocal {
  final pref_key_theme = 'pref_key_theme';

  @override
  Future<SpaceXTheme> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(pref_key_theme);
    if (themeString == null) {
      return SpaceXTheme.unknown;
    }
    return enumFromString<SpaceXTheme>(themeString, SpaceXTheme.values);
  }

  @override
  Future<void> setTheme(SpaceXTheme theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(pref_key_theme, theme.toString());
  }
}
