import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/models/video_model.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatelessWidget {
  const CustomVideoPlayer({
    super.key,
    required this.url,
    required this.videoType,
  });

  // final Size size;
  final String url;
  final VideoType videoType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log("Type: $videoType URL: $url");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.chartGray,
                borderRadius: BorderRadius.circular(12),
              ),
              // height: 200,
              width: size.width * 0.9,

              child:
                  videoType == VideoType.youtube
                      ? YouTubeVideoPlayer(videoUrl: url)
                      : VimeoPlayerWidget(videoId: url.split('/').last),
            ),
          ),
        ),
      ],
    );
  }
}

class VimeoPlayerWidget extends StatelessWidget {
  final String videoId;

  const VimeoPlayerWidget({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: VimeoPlayer(videoId: videoId),
    );
  }
}

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YouTubeVideoPlayer({super.key, required this.videoUrl});

  @override
  State<YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;
  bool isMute = false;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    log(videoId.toString());
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? "",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: isMute,
        controlsVisibleAtStart: true,
        enableCaption: false,
        hideThumbnail: false,
        showLiveFullscreenButton: false,
        useHybridComposition: false,
        isLive: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      aspectRatio: 16 / 9,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
        ),

        PlaybackSpeedButton(),

        // volumn controller
        IconButton(
          onPressed: () {
            setState(() {
              if (isMute) {
                _controller.unMute();
              } else {
                _controller.mute();
              }
              isMute = !isMute;
            });
          },
          icon: Icon(
            !isMute ? Icons.volume_up_rounded : Icons.volume_off_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
