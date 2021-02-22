import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_scene.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/settings/settings_scene.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/splash/splash_scene.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final List<Widget> _scenes = [
    LaunchesScene(),
    SplashScene(),
    SettingsScene(),
  ];

  final currentIndex = 0.obs;

  Widget get currentScene => _scenes[currentIndex.value];

  void changeScene(int _index) {
    currentIndex.value = _index;
  }
}
