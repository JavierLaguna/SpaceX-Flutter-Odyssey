import 'package:flutter/material.dart';

class LaunchImage extends StatelessWidget {
  final String? _remoteImage;

  const LaunchImage({String? remoteImage}) : this._remoteImage = remoteImage;

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
