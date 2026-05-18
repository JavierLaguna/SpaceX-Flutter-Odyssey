import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final String videoId;
  final bool autoPlay;
  late final YoutubePlayerController _controller;

  YoutubePlayerWidget({required this.videoId, this.autoPlay = false})
      : super() {

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: autoPlay,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      // youtube_player_flutter doesn't support macOS; show placeholder
      return Container(
        height: 200,
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_circle_outline, size: 64, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                'Video player not available on desktop',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Theme.of(context).colorScheme.primary,
    );
  }
}
