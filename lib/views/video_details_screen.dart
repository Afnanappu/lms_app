import 'package:flutter/material.dart';
import 'package:lms_app/components/custom_video_player.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/models/video_model.dart';

class VideoDetailsScreen extends StatelessWidget {
  const VideoDetailsScreen({super.key, required this.videoModel});
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: add hero animation

            // Video Player
            CustomVideoPlayer(
              url: videoModel.videoUrl,
              videoType: videoModel.videoType,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    videoModel.title,
                    style: const TextStyle(
                      color: AppColors.primaryGradientEnd,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    videoModel.description,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
