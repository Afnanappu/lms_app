import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/models/video_model.dart';

class VideoListCard extends StatelessWidget {
  const VideoListCard({super.key, required this.videoModel, this.onTap});

  final VideoModel videoModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          videoModel.title,
          style: TextStyle(
            color: AppColors.primaryLightPurple,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          videoModel.description,
          style: TextStyle(fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Icon(
          Icons.play_circle_fill_rounded,
          color: AppColors.primaryLightPurple,
        ),
      ),
    );
  }
}
