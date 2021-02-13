import 'package:SpaceXFlutterOdyssey/di/main_injector.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/home_scene.dart';
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        title: 'Space X Flutter Odyssey',
        initialBinding: MainInjector(),
        home: HomePage());
  }
}
