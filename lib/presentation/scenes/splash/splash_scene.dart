import 'package:SpaceXFlutterOdyssey/presentation/scenes/splash/splash_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScene extends GetWidget<SplashViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                1
              ],
              colors: [
                SpaceXColors.gray,
                SpaceXColors.orange,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/spacex-patch.png'),
              Image.asset('assets/images/spacex-logo.png'),
            ],
          ),
        ),
      ),
    );
  }
}
