import 'package:SpaceXFlutterOdyssey/domain/Interactors/get_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_viewmodel.dart';
import 'package:get/get.dart';

class LaunchesInjector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaunchesViewModel(Get.find<GetLaunchesInteractor>()));
  }
}
