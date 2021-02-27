import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/get_theme_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/set_theme_interactor.dart';

abstract class InitAppInteractor {
  onInitApp();
}

class InitAppInteractorImpl extends InitAppInteractor {
  final GetThemeInteractor _getThemeInteractor;
  final SetThemeInteractor _setThemeInteractor;

  InitAppInteractorImpl(this._getThemeInteractor, this._setThemeInteractor);

  @override
  onInitApp() {
    _loadAppTheme();
  }

  Future<void> _loadAppTheme() async {
    final usesDarkMode = await _getThemeInteractor.usesDarkMode();
    await _setThemeInteractor.setDarkMode(usesDarkMode);
  }
}
