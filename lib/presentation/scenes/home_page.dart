import 'package:SpaceXFlutterOdyssey/presentation/providers/launches_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var launches = context.watch<LaunchesProvider>();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Text('Hello world!'),
      ),
    );
  }
}
