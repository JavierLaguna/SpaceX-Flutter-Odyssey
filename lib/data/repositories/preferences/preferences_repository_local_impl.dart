import 'package:SpaceXFlutterOdyssey/domain/entities/spacex_theme.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryLocalImpl extends PreferencesRepositoryLocal {
  final pref_key_theme = 'pref_key_theme';

  @override
  Future<SpaceXTheme> getTheme() async {
    var prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(pref_key_theme);

    if (themeString == null) {
      return SpaceXTheme.unknown;
    }

    final theme = EnumToString.fromString(SpaceXTheme.values, themeString,
        camelCase: true);
    return theme ?? SpaceXTheme.unknown;
  }

  @override
  Future<void> setTheme(SpaceXTheme theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(pref_key_theme, EnumToString.convertToString(theme));
  }
}
