import 'package:SpaceXFlutterOdyssey/presentation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.05,
                1
              ],
              colors: [
                SpaceXColors.secondaryText,
                SpaceXColors.orange,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/spacex-logo.png'),
              Text(
                'Flutter Odyssey',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
