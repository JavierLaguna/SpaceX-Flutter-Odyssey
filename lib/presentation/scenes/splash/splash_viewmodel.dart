import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  @override
  void onReady() {
    super.onReady();

    _navigateToHomeDelay();
  }

  _navigateToHomeDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigateToHome();
  }

  _navigateToHome() {
    Get.offNamed(SpaceXRoutes.launches);
  }
}
