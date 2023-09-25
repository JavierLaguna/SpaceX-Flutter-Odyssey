import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/get_theme_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/set_theme_interactor.dart';
import 'package:get/get.dart';

class SettingsViewModel extends GetxController {
  final GetThemeInteractor _getThemeInteractor;
  final SetThemeInteractor _setThemeInteractor;

  SettingsViewModel(this._getThemeInteractor, this._setThemeInteractor);

  RxBool isDarkMode = false.obs;

  @override
  void onReady() {
    super.onReady();

    _getTheme();
  }

  void _getTheme() async {
    final usesDarkMode = await _getThemeInteractor.usesDarkMode();
    isDarkMode(usesDarkMode);
  }

  void setTheme(bool usesDarkMode) async {
    isDarkMode(usesDarkMode);
    await _setThemeInteractor.setDarkMode(usesDarkMode);
  }
}
