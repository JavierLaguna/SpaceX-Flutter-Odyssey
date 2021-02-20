import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/list_launches_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchesScene extends GetWidget<LaunchesViewModel> {

  LaunchesViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Launches'),
      ),
      body: SafeArea(
        bottom: false,
        child: Obx(() => ListLaunchesWidget(_viewModel.launches.value)),
      ),
    );
  }
}
