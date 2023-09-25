import 'package:SpaceXFlutterOdyssey/di/main_injector.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_routes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/routes/spacex_scenes.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //theme: spaceXLightTheme,
      title: 'Space X Flutter Odyssey',
      initialBinding: MainInjector(),
      initialRoute: SpaceXRoutes.splash,
      getPages: SpaceXScenes.scenes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // Debug things
      enableLog: true,
      debugShowCheckedModeBanner: true,
    );
  }
}
