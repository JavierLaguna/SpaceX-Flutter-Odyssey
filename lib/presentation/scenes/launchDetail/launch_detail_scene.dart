import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LaunchDetailScene extends GetWidget<LaunchDetailViewModel> {
  LaunchDetailViewModel get _viewModel => super.controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var launch = _viewModel.launch.value;

      return Scaffold(
        appBar: AppBar(
          title: Text(launch.name),
        ),
        body: SafeArea(
          child: Column(
            children: [
              YoutubePlayerWidget(
                videoId: launch.youtubeId,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      launch.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    _Separator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${tr('launchDetail.flightNumber')}${launch.flightNumber.toString()}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          launch.success
                              ? 'launchDetail.success'
                              : 'launchDetail.failure',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                                color: launch.success
                                    ? Theme.of(context).colorScheme.success
                                    : Theme.of(context).colorScheme.error,
                              ),
                        ).tr(),
                      ],
                    ),
                    _Separator(),
                    Text(
                      'launchDetail.detailOfFlight',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ).tr(),
                    _Separator(),
                    Text(launch.details),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
    );
  }
}
