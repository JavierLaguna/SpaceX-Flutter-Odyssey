import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LaunchDetailScene extends GetWidget<LaunchDetailViewModel> {
  LaunchDetailViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(_viewModel.launch.value.name),
        ),
        body: SafeArea(
          child: Text(_viewModel.launch.value.flightNumber.toString()),
        ),
      ),
    );
  }
}
