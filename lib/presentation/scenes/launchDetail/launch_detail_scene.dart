import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
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
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _viewModel.launch.value.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                _TextSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${tr('launchDetail.flightNumber')}${_viewModel.launch.value.flightNumber.toString()}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      _viewModel.launch.value.success
                          ? 'launchDetail.success'
                          : 'launchDetail.failure',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _viewModel.launch.value.success
                                ? Theme.of(context).colorScheme.success
                                : Theme.of(context).colorScheme.error,
                          ),
                    ).tr(),
                  ],
                ),
                _TextSeparator(),
                Text(
                  'launchDetail.detailOfFlight',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ).tr(),
                _TextSeparator(),
                Text(_viewModel.launch.value.details),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
    );
  }
}
