import 'package:SpaceXFlutterOdyssey/presentation/scenes/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScene extends GetWidget<HomeViewModel> {
  HomeViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _viewModel.currentIndex.value,
          onTap: _viewModel.changeScene,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.airplanemode_active_rounded), label: 'Launches'),
            BottomNavigationBarItem(icon: Icon(Icons.precision_manufacturing_rounded), label: 'Rockets'),
            BottomNavigationBarItem(icon: Icon(Icons.app_settings_alt_rounded), label: 'Settings'),
          ],
        ),
        body: _viewModel.currentScene,
      ),
    );
  }
}
