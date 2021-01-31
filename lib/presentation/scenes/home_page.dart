import 'package:SpaceXFlutterOdyssey/presentation/providers/launches_provider.dart';
import 'package:SpaceXFlutterOdyssey/presentation/widgets/list_launches_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var launchesProvider = context.watch<LaunchesProvider>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListLaunchesWidget(launchesProvider.launches),
      ),
    );
  }
}
