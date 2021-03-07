import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final String videoId;
  final bool autoplay;
  YoutubePlayerController _controller;

  YoutubePlayerWidget({Key key, this.videoId, this.autoplay = false})
      : super(key: key) {
    this._controller = YoutubePlayerController(
      initialVideoId: this.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: this.autoplay,
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
