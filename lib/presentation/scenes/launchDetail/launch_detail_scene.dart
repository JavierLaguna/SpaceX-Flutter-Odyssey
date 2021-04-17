import 'package:SpaceXFlutterOdyssey/presentation/scenes/launchDetail/launch_detail_viewmodel.dart';
import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/empty_widget.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/launchpad_map_widget.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/loading_full_screen_widget.dart';
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

    _showLaunchpadLocation() {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return Obx(() {
              return LaunchpadMap(launchpad: _viewModel.launchpad.value!);
            });
          });
    }

    return Obx(() {
      if (_viewModel.launch.value == null) {
        return LoadingFullScrWidget();
      }

      final launch = _viewModel.launch.value!;
      final success = launch.success ?? false;

      return Scaffold(
        appBar: AppBar(
          title: Text(launch.name),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _showLaunchpadLocation,
          label: Text('launchDetail.launchpadLocation').tr(),
          icon: Icon(Icons.location_on),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                launch.youtubeId != null
                    ? YoutubePlayerWidget(
                        videoId: launch.youtubeId!,
                      )
                    : EmptyWidget(),
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
                      _DetailSection(
                        details: launch.details,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _DetailSection extends StatelessWidget {
  final String? _details;

  const _DetailSection({String? details}) : this._details = details;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _details == null
        ? EmptyWidget()
        : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'launchDetail.detailOfFlight',
              style: theme.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ).tr(),
            _Separator(),
            Text(_details!),
          ]);
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
