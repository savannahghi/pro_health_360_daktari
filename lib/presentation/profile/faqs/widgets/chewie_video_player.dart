// Flutter imports:
// Package imports:
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayer extends StatefulWidget {
  const ChewieVideoPlayer({
    Key? key,
    this.chewieController,
    required this.thumbnail,
  }) : super(key: key);

  final Future<ChewieController?>? chewieController;
  final String thumbnail;

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChewieController?>(
      future: widget.chewieController,
      builder:
          (BuildContext context, AsyncSnapshot<ChewieController?> snapshot) {
        final VideoPlayerController? videoPlayerController =
            snapshot.data?.videoPlayerController;
        if (!snapshot.hasData ||
            (videoPlayerController != null &&
                !videoPlayerController.value.isInitialized)) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // TODO(abiud): replace with cached network image to
                    // handle showing an image before the network one loads
                    image: NetworkImage(
                      widget.thumbnail,
                    ),
                  ),
                ),
              ),
              const CircularProgressIndicator(color: Colors.white),
            ],
          );
        }
        return Chewie(controller: snapshot.data!);
      },
    );
  }
}
