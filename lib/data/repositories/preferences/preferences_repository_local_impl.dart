import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryLocalImpl extends PreferencesRepositoryLocal {
  final pref_key_usesDarkMode = 'pref_key_usesDarkMode';

  @override
  Future<bool> getUsesDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(pref_key_usesDarkMode);
  }

  @override
  Future<void> setUsesDarkMode(bool useDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(pref_key_usesDarkMode, useDarkMode);
  }
}
