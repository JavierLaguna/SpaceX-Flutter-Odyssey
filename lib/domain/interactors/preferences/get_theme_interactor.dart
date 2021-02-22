import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';

abstract class GetThemeInteractor {
  Future<bool> usesDarkMode();
}

class GetThemeInteractorImpl extends GetThemeInteractor {
  final PreferencesRepositoryLocal _repositoryLocal;

  GetThemeInteractorImpl(this._repositoryLocal)
      : assert(_repositoryLocal != null);

  @override
  Future<bool> usesDarkMode() async {
    final usesDarkMode = await _repositoryLocal.getUsesDarkMode();
    return usesDarkMode;
  }
}
