import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'gradient_video_background.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true);
    // ..play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GestureDetector(
          onTap: () => controller.value.isPlaying
              ? controller.pause()
              : controller.play(),
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                const VideoBackground(),
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: _VideoCaption(
                    caption: widget.caption,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: VideoProgressIndicator(
                      controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: Colors.white,
                        bufferedColor: Colors.white.withOpacity(0.5),
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),
                      padding: const EdgeInsets.all(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle? titleStyle = Theme.of(context).textTheme.titleMedium;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
