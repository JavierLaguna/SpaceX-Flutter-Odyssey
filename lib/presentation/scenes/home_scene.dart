import 'package:SpaceXFlutterOdyssey/presentation/widgets/list_launches_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final launchesProvider = context.watch<LaunchesProvider>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListLaunchesWidget([]),
      ),
    );
  }
}
