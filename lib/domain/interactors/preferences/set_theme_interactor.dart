import 'package:SpaceXFlutterOdyssey/domain/entities/spacex_theme.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class SetThemeInteractor {
  Future<void> setDarkMode(bool useDarkMode);
}

class SetThemeInteractorImpl extends SetThemeInteractor {
  final PreferencesRepositoryLocal _repositoryLocal;

  SetThemeInteractorImpl(this._repositoryLocal)
      : assert(_repositoryLocal != null);

  @override
  Future<void> setDarkMode(bool useDarkMode) async {
    final selectedTheme = useDarkMode ? SpaceXTheme.dark : SpaceXTheme.light;

    _modifyStatusBarColor(selectedTheme);
    _modifyAppTheme(selectedTheme);
    await _repositoryLocal.setTheme(selectedTheme);
  }

  _modifyStatusBarColor(SpaceXTheme theme) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: theme == SpaceXTheme.dark // Color for Android
          ? spaceXDarkTheme.appBarTheme.color
          : spaceXLightTheme.appBarTheme.color,
      statusBarBrightness:
          theme == SpaceXTheme.dark // Dark == white status bar -- for IOS.
              ? Brightness.dark
              : Brightness.light,
    ));
  }

  _modifyAppTheme(SpaceXTheme theme) {
    Get.changeTheme(
        theme == SpaceXTheme.dark ? spaceXDarkTheme : spaceXLightTheme);
  }
}
