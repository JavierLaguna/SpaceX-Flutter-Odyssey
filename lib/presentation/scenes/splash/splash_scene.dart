import 'package:SpaceXFlutterOdyssey/presentation/scenes/splash/splash_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScene extends GetWidget<SplashViewModel> {
  SplashViewModel get _viewModel => super.controller;

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
              _SpaceXLogo(_viewModel.navigateToHome),
              Image.asset('assets/images/spacex-logo.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpaceXLogo extends StatefulWidget {
  final Function() _animationDidFinish;

  const _SpaceXLogo(this._animationDidFinish);

  @override
  __SpaceXLogoState createState() => __SpaceXLogoState();
}

class __SpaceXLogoState extends State<_SpaceXLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 0.3,
        upperBound: 1.0);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget._animationDidFinish();
      }
    });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animationController,
      child: Image.asset('assets/images/spacex-patch.png'),
    );
  }
}
