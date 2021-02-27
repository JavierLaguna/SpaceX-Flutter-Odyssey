import 'package:SpaceXFlutterOdyssey/domain/interactors/app/init_app_interactor.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  final InitAppInteractor _initAppInteractor;

  SplashViewModel(this._initAppInteractor);

  @override
  void onInit() {
    super.onInit();

    _initAppInteractor.onInitApp();
  }

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
    Get.offNamed(SpaceXRoutes.home);
  }
}
