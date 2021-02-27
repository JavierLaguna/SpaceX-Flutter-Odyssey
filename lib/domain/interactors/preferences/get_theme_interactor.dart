import 'package:SpaceXFlutterOdyssey/domain/repositories/device/device_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';

abstract class GetThemeInteractor {
  Future<bool> usesDarkMode();
}

class GetThemeInteractorImpl extends GetThemeInteractor {
  final DeviceRepository _deviceRepository;
  final PreferencesRepositoryLocal _repositoryLocal;

  GetThemeInteractorImpl(this._deviceRepository, this._repositoryLocal)
      : assert(_deviceRepository != null, _repositoryLocal != null);

  @override
  Future<bool> usesDarkMode() async {
    final usesDarkMode = await _repositoryLocal.getUsesDarkMode();
    return usesDarkMode;
  }
}
