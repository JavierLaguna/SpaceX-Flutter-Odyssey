import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/list_launches_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchesScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Get.find<LaunchesViewModel>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(() => ListLaunchesWidget(_viewModel.launches.value)),
      ),
    );
  }
}
