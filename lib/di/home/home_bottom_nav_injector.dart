import 'package:SpaceXFlutterOdyssey/presentation/scenes/homeBottomNav/home_bottom_nav_viewmodel.dart';
import 'package:get/get.dart';

class HomeBottomNavInjector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeBottomNavViewModel());
  }
}
