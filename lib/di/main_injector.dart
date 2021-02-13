import 'package:SpaceXFlutterOdyssey/data/datasources/spacex_service/launch_service.dart';
import 'package:SpaceXFlutterOdyssey/data/repositories/launch/launch_repository_remote_impl.dart';
import 'package:SpaceXFlutterOdyssey/domain/Interactors/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/domain/repositories/launch/launch_remote_repository.dart';
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
    Get.lazyPut<LaunchService>(() => LaunchService());
  }

  // Repositories
  _repositories() {
    Get.lazyPut<LaunchRepositoryRemote>(
        () => LaunchRepositoryRemoteImpl(Get.find<LaunchService>()));
  }

  // Interactors
  _interactors() {
    Get.lazyPut<GetLaunchesInteractor>(
        () => GetLaunchesInteractorImpl(Get.find<LaunchRepositoryRemote>()));
  }
}
