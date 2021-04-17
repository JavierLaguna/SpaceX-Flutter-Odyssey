import 'package:flutter/material.dart';

class GestureBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 4,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: theme.bottomAppBarColor,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );
  }
}
