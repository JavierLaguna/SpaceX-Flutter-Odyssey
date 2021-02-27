import 'package:SpaceXFlutterOdyssey/domain/entities/spacex_theme.dart';

abstract class PreferencesRepositoryLocal {
  Future<SpaceXTheme> getTheme();

  Future<void> setTheme(SpaceXTheme theme);
}
