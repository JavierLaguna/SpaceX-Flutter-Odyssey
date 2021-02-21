import 'package:SpaceXFlutterOdyssey/di/home/home_injector.dart';
import 'package:SpaceXFlutterOdyssey/di/launches/launches_injector.dart';
import 'package:SpaceXFlutterOdyssey/di/splash/splash_injector.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/home/home_scene.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_scene.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/splash/splash_scene.dart';
import 'package:get/get.dart';

class SpaceXScenes {
  static final scenes = [
    GetPage(
      name: SpaceXRoutes.splash,
      page: () => SplashScene(),
      binding: SplashInjector(),
    ),
    GetPage(
      name: SpaceXRoutes.home,
      page: () => HomeScene(),
      binding: HomeInjector(),
      bindings: [LaunchesInjector()], // Home BottomNavigationBar Items
    ),
    GetPage(
      name: SpaceXRoutes.launches,
      page: () => LaunchesScene(),
      binding: LaunchesInjector(),
    ),
  ];
}
