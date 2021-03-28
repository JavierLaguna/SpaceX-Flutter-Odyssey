import 'package:SpaceXFlutterOdyssey/domain/entities/spacex_theme.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/device/device_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';

abstract class GetThemeInteractor {
  Future<bool> usesDarkMode();
}

class GetThemeInteractorImpl extends GetThemeInteractor {
  final DeviceRepository _deviceRepository;
  final PreferencesRepositoryLocal _repositoryLocal;

  GetThemeInteractorImpl(this._deviceRepository, this._repositoryLocal);

  @override
  Future<bool> usesDarkMode() async {
    final theme = await _repositoryLocal.getTheme();

    if (theme == SpaceXTheme.unknown) {
      final deviceUseDarkMode =
          await _deviceRepository.isDeviceDarkModeEnabled();
      return deviceUseDarkMode;
    }

    return theme == SpaceXTheme.dark;
  }
}
