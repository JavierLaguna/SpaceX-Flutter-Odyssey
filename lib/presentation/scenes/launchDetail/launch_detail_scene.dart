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
    final theme = Theme.of(context);

    return Obx(() {
      if (_viewModel.launch.value == null) {
        return Text('HOLA');
      } else {

        final launch = _viewModel.launch.value!;

        final success = launch.success ?? false;

        return Scaffold(
          appBar: AppBar(
            title: Text(launch.name),
          ),
          body: SafeArea(
            child: Column(
              children: [
                // YoutubePlayerWidget(
                //   videoId: launch.youtubeId,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.name,
                        style: theme.textTheme.headline4!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      _Separator(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${tr('launchDetail.flightNumber')}${launch.flightNumber.toString()}',
                            style: theme.textTheme.subtitle1,
                          ),
                          Text(
                            success
                                ? 'launchDetail.success'
                                : 'launchDetail.failure',
                            style: theme.textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: success
                                  ? theme.colorScheme.success
                                  : theme.colorScheme.error,
                            ),
                          ).tr(),
                        ],
                      ),
                      _Separator(),
                      Text(
                        DateFormat('E, d MMM, yyyy  -  h:mm a')
                            .format(launch.launchDateLocal),
                        style: theme.textTheme.subtitle2,
                      ),
                      _Separator(),
                      Text(
                        'launchDetail.detailOfFlight',
                        style: theme.textTheme.headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ).tr(),
                      _Separator(),
                      // Text(launch.details),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
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
