import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/loading_full_screen_widget.dart';
import 'package:flutter/material.dart';

class LaunchesListWidget extends StatelessWidget {
  final List<Launch> _launches;
  final Function(Launch) _onTapLaunch;
  final Future<void> Function()? _onRefresh;

  const LaunchesListWidget({
    required List<Launch> launches,
    required Function(Launch) onTapLaunch,
    Future<void> Function()? onRefresh,
  })  : _launches = launches,
        _onTapLaunch = onTapLaunch,
        _onRefresh = onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _launches.isEmpty
          ? _EmptyListWidget()
          : _onRefresh != null
              ? RefreshIndicator(
                  onRefresh: _onRefresh!,
                  child: _LaunchesList(
                    launches: _launches,
                    onTapLaunch: _onTapLaunch,
                  ),
                )
              : _LaunchesList(
                  launches: _launches,
                  onTapLaunch: _onTapLaunch,
                ),
    );
  }
}

class _LaunchesList extends StatelessWidget {
  final List<Launch> _launches;
  final Function(Launch) _onTapLaunch;

  const _LaunchesList({
    required List<Launch> launches,
    required Function(Launch) onTapLaunch,
  })   : _launches = launches,
        _onTapLaunch = onTapLaunch;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: _launches.length,
      itemBuilder: (context, index) {
        final launch = _launches[index];

        return InkWell(
          onTap: () => _onTapLaunch(launch),
          child: Card(
            key: Key(launch.flightNumber.toString()),
            clipBehavior: Clip.antiAlias,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _LaunchImage(
                    remoteImage: launch.patchImageSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      launch.name,
                      style: theme.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LaunchImage extends StatelessWidget {
  final String? _remoteImage;

  const _LaunchImage({String? remoteImage}) : this._remoteImage = remoteImage;

  @override
  Widget build(BuildContext context) {
    return _remoteImage == null
        ? Image.asset('assets/images/launch-placeholder.png')
        : Image(
            image: NetworkImage(_remoteImage!),
            fit: BoxFit.fill,
          );
  }
}

class _EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingFullScrWidget();
  }
}
