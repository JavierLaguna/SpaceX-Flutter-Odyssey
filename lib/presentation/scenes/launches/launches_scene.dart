import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/presentation/scenes/launches/launches_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/grid_launches_widget.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/list_launches_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LaunchesScene extends GetWidget<LaunchesViewModel> {
  LaunchesViewModel get _viewModel => super.controller;

  Widget _getBodyWidget({
    required bool isListMode,
    required List<Launch> launches,
    required Function(Launch) onTapLaunch,
    Future<void> Function()? onRefresh,
  }) {
    return isListMode
        ? LaunchesListWidget(
            launches: launches,
            onTapLaunch: onTapLaunch,
            onRefresh: onRefresh,
          )
        : LaunchesGridWidget(
            launches: launches,
            onTapLaunch: onTapLaunch,
            onRefresh: onRefresh,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('launches.title').tr(),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(_viewModel.isListMode.value
                  ? Icons.grid_view
                  : Icons.amp_stories),
              onPressed: () {
                _viewModel.changeShowMode(!_viewModel.isListMode.value);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: _getBodyWidget(
              isListMode: _viewModel.isListMode.value,
              launches: _viewModel.launches.value,
              onTapLaunch: _viewModel.onSelectLaunch,
              onRefresh: _viewModel.refreshLaunches,
            ),
          ),
        ),
      ),
    );
  }
}
