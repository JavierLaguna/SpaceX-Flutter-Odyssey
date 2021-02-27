import 'package:SpaceXFlutterOdyssey/domain/entities/spacex_theme.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
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

    _modifyAppTheme(selectedTheme);
    await _repositoryLocal.setTheme(selectedTheme);
  }

  _modifyAppTheme(SpaceXTheme theme) {
    Get.changeTheme(
        theme == SpaceXTheme.dark ? spaceXLightTheme : spaceXLightTheme);
  }
}
