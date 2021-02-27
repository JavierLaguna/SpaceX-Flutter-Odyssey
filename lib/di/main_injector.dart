import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launch_service.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/device/device_repository_impl.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/launch/launch_repository_remote_impl.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/preferences/preferences_repository_local_impl.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/get_theme_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/device/device_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:get/get.dart';

class MainInjector extends Bindings {
  @override
  void dependencies() {
    _services();
    _repositories();
    _interactors();
  }

  // Services
  _services() {
    Get.lazyPut<LaunchService>(
      () => LaunchService(),
    );
  }

  // Repositories
  _repositories() {
    Get.lazyPut<LaunchRepositoryRemote>(() => LaunchRepositoryRemoteImpl(
          Get.find<LaunchService>(),
        ));

    Get.lazyPut<PreferencesRepositoryLocal>(
      () => PreferencesRepositoryLocalImpl(),
    );

    Get.lazyPut<DeviceRepository>(
      () => DeviceRepositoryImpl(),
    );
  }

  // Interactors
  _interactors() {
    Get.lazyPut<GetLaunchesInteractor>(() => GetLaunchesInteractorImpl(
          Get.find<LaunchRepositoryRemote>(),
        ));

    Get.lazyPut<GetThemeInteractor>(() => GetThemeInteractorImpl(
          Get.find<DeviceRepository>(),
          Get.find<PreferencesRepositoryLocal>(),
        ));
  }
}
