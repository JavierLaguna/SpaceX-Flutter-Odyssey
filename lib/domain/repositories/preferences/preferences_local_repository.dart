
abstract class PreferencesRepositoryLocal {
  Future<bool> getUsesDarkMode();
  Future<void> setUsesDarkMode(bool useDarkMode);
}
