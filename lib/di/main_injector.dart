import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/landpad_service.dart';
import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launch_service.dart';
import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launchpad_service.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/device/device_repository_impl.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/landpads/landpads_remote_repository_impl.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/launch/launch_repository_remote_impl.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/launchpad/launchpads_remote_repository_impl.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/preferences/preferences_repository_local_impl.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/app/init_app_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/landpads/get_landpad_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/landpads/get_landpads_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_latest_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launchpads/get_launchpad_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/launchpads/get_launchpads_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/get_theme_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/interactors/preferences/set_theme_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/device/device_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/landpads/landpads_remote_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launchpad/launchpads_remote_repository.dart';
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
  void _services() {
    Get.lazyPut<LaunchService>(
      () => LaunchService(),
    );

    Get.lazyPut<LandPadService>(
      () => LandPadService(),
    );

    Get.lazyPut<LaunchpadService>(
      () => LaunchpadService(),
    );
  }

  // Repositories
  void _repositories() {
    Get.lazyPut<LaunchRepositoryRemote>(() => LaunchRepositoryRemoteImpl(
          Get.find<LaunchService>(),
        ));

    Get.lazyPut<LandPadsRepositoryRemote>(() => LandPadsRepositoryRemoteImpl(
          Get.find<LandPadService>(),
        ));

    Get.lazyPut<LaunchpadsRepositoryRemote>(
        () => LaunchpadsRepositoryRemoteImpl(
              Get.find<LaunchpadService>(),
            ));

    Get.lazyPut<PreferencesRepositoryLocal>(
      () => PreferencesRepositoryLocalImpl(),
    );

    Get.lazyPut<DeviceRepository>(
      () => DeviceRepositoryImpl(),
    );
  }

  // Interactors
  void _interactors() {
    Get.lazyPut<GetUpcomingLaunchesInteractor>(
        () => GetUpcomingLaunchesInteractorImpl(
              Get.find<LaunchRepositoryRemote>(),
            ));

    Get.lazyPut<GetLaunchesInteractor>(() => GetLaunchesInteractorImpl(
          Get.find<LaunchRepositoryRemote>(),
        ));

    Get.lazyPut<GetLandPadsInteractor>(() => GetLandPadsInteractorImpl(
          Get.find<LandPadsRepositoryRemote>(),
        ));

    Get.lazyPut<GetLandPadInteractor>(() => GetLandPadInteractorImpl(
          Get.find<LandPadsRepositoryRemote>(),
        ));

    Get.lazyPut<GetLaunchpadsInteractor>(() => GetLaunchpadsInteractorImpl(
          Get.find<LaunchpadsRepositoryRemote>(),
        ));

    Get.put<GetLaunchpadInteractor>(GetLaunchpadInteractorImpl(
      Get.find<LaunchpadsRepositoryRemote>(),
    ));

    Get.put<GetThemeInteractor>(GetThemeInteractorImpl(
      Get.find<DeviceRepository>(),
      Get.find<PreferencesRepositoryLocal>(),
    ));

    Get.put<SetThemeInteractor>(SetThemeInteractorImpl(
      Get.find<PreferencesRepositoryLocal>(),
    ));

    Get.lazyPut<InitAppInteractor>(() => InitAppInteractorImpl(
          Get.find<GetThemeInteractor>(),
          Get.find<SetThemeInteractor>(),
    ));
  }
}
