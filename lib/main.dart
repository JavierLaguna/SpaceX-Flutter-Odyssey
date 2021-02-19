import 'package:SpaceXFlutterOdyssey/di/main_injector.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_scenes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: true,
      theme: spaceXLightTheme,
      title: 'Space X Flutter Odyssey',
      initialBinding: MainInjector(),
      initialRoute: SpaceXRoutes.splash,
      getPages: SpaceXScenes.scenes,
    );
  }
}
