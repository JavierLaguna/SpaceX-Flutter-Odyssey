import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/get_theme_interactor.dart';
import 'package:get/get.dart';

class SettingsViewModel extends GetxController {
  final GetThemeInteractor _getThemeInteractor;

  SettingsViewModel(this._getThemeInteractor);

  RxBool isDarkMode = true.obs;

  @override
  void onReady() {
    super.onReady();

    _getTheme();
  }

  _getTheme() async {
    final usesDarkMode = await _getThemeInteractor.usesDarkMode();
    this.isDarkMode(usesDarkMode);
  }

  setTheme(bool usesDarkMode) async {
    this.isDarkMode(usesDarkMode);

  }
}
