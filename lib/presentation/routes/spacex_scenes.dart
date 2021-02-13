import 'package:SpaceXFlutterOdyssey/di/launches/launches_injector.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_scene.dart';
import 'package:get/get.dart';

class SpaceXScenes {
  static final scenes = [
    // GetPage(name: SpaceXRoutes.splash, page: () => null),
    GetPage(
        name: SpaceXRoutes.launches,
        page: () => LaunchesScene(),
        binding: LaunchesInjector()),
  ];
}
