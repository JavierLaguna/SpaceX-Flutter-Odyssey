import 'package:SpaceXFlutterOdyssey/presentation/scenes/splash/splash_viewmodel.dart';
import 'package:get/get.dart';

class SplashInjector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewModel());
  }
}
