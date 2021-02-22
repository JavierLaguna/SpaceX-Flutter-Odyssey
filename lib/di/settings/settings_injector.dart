import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/get_theme_interactor.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/settings/settings_viewmodel.dart';
import 'package:get/get.dart';

class SettingsInjector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsViewModel(Get.find<GetThemeInteractor>()));
  }
}
