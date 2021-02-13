import 'package:SpaceXFlutterOdyssey/di/injector.dart';
import 'package:SpaceXFlutterOdyssey/presentation/providers/launches_provider.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/home_scene.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  setUpDI();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => GetIt.I<LaunchesProvider>()..getLaunches())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Space X Flutter Odyssey',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomePage(),
      ),
    );
  }
}
