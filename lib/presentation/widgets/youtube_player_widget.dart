import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final String videoId;
  final bool autoPlay;
  late YoutubePlayerController _controller;

  YoutubePlayerWidget({required this.videoId, this.autoPlay = false})
      : super() {

    this._controller = YoutubePlayerController(
      initialVideoId: this.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: this.autoPlay,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Theme.of(context).toggleableActiveColor,
    );
  }
}
