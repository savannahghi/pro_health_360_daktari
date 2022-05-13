// Package imports:
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerInitializer {
  Future<ChewieController> initializePlayer({
    required VideoPlayerController videoPlayerController,
    required bool autoPlay,
  }) async {
    await videoPlayerController.initialize();
    return _createChewieController(autoPlay, videoPlayerController);
  }

  ChewieController _createChewieController(
    bool autoPlay,
    VideoPlayerController videoPlayerController,
  ) {
    return ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: autoPlay,
      systemOverlaysAfterFullScreen: <SystemUiOverlay>[SystemUiOverlay.bottom, SystemUiOverlay.top,],
      deviceOrientationsAfterFullScreen: <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
  }
}
