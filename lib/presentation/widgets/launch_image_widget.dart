import 'package:flutter/material.dart';

class LaunchImage extends StatelessWidget {
  final String _kLocalPlaceholder = 'assets/images/launch-placeholder.png';
  final String? _remoteImage;

  const LaunchImage({String? remoteImage}) : this._remoteImage = remoteImage;

  @override
  Widget build(BuildContext context) {
    return _remoteImage == null
        ? Image.asset(_kLocalPlaceholder)
        : FadeInImage.assetNetwork(
            placeholder: _kLocalPlaceholder,
            image: _remoteImage!,
          );
  }
}
