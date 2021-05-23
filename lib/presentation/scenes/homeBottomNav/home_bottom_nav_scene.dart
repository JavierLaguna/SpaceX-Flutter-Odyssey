import 'package:SpaceXFlutterOdyssey/presentation/scenes/homeBottomNav/home_bottom_nav_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomNavScene extends GetWidget<HomeBottomNavViewModel> {
  HomeBottomNavViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: _viewModel.currentIndex.value,
          onTap: _viewModel.changeScene,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: tr('home.tabs.home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplanemode_active_rounded),
                label: tr('home.tabs.launches')),
            BottomNavigationBarItem(
                icon: Icon(Icons.precision_manufacturing_rounded),
                label: tr('home.tabs.rockets')),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_settings_alt_rounded),
                label: tr('home.tabs.settings')),
          ],
        ),
        body: _viewModel.currentScene,
      ),
    );
  }
}
