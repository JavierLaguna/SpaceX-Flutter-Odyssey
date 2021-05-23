import 'package:SpaceXFlutterOdyssey/domain/entities/launch.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/loading_full_screen_widget.dart';
import 'package:flutter/material.dart';

import 'launch_image_widget.dart';

class AnimatedLaunchesList extends StatelessWidget {
  final List<Launch> _launches;
  final Function(Launch) _onTapLaunch;

  const AnimatedLaunchesList({
    required List<Launch> launches,
    required Function(Launch) onTapLaunch,
  })   : _launches = launches,
        _onTapLaunch = onTapLaunch;

  @override
  Widget build(BuildContext context) {
    return _launches.isEmpty
        ? _EmptyListWidget()
        : _AnimatedLaunchesList(
            launches: _launches,
            onTapLaunch: _onTapLaunch,
          );
  }
}

class _AnimatedLaunchesList extends StatefulWidget {
  final List<Launch> _launches;
  final Function(Launch) _onTapLaunch;

  const _AnimatedLaunchesList({
    required List<Launch> launches,
    required Function(Launch) onTapLaunch,
  })   : _launches = launches,
        _onTapLaunch = onTapLaunch;

  @override
  __AnimatedLaunchesListState createState() => __AnimatedLaunchesListState();
}

class __AnimatedLaunchesListState extends State<_AnimatedLaunchesList> {
  final _pageController = PageController(
    viewportFraction: 0.35,
  );

  double _currentPage = 0.0;

  void _scrollListener() {
    setState(() {
      _currentPage = _pageController.page ?? 0.0;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollListener);
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          height: 100,
          child: Container(
            color: Colors.red,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: -size.height * 0.15,
          height: size.height * 0.3,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.appBarTheme.backgroundColor!,
                  blurRadius: 90,
                  spreadRadius: 45,
                ),
              ],
            ),
          ),
        ),
        Transform.scale(
          scale: 1.6,
          alignment: Alignment.bottomCenter,
          child: PageView.builder(
            allowImplicitScrolling: true,
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: widget._launches.length + 1,
            itemBuilder: (_, index) {
              if (index == 0) {
                return SizedBox.shrink();
              }

              final launch = widget._launches[index - 1];
              final result = _currentPage - index + 1;
              final value = -0.4 * result + 1;
              final opacity = value.clamp(0.0, 1.0);

              return Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(0.0, size.height / 2.6 * (1 - value).abs())
                    ..scale(value),
                  child: Opacity(
                    opacity: opacity,
                    child: LaunchImage(
                      remoteImage: launch.patchImageLarge,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingFullScrWidget();
  }
}
