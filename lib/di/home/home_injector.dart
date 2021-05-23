import 'package:SpaceXFlutterOdyssey/domain/interactors/launches/get_latest_launches_interactor.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/home/home_viewmodel.dart';
import 'package:get/get.dart';

class HomeInjector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(Get.find<GetLatestLaunchesInteractor>()));
  }
}
