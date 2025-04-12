import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/models/video_model.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.chartGray,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
              width: size.width * 0.8,

              child: Stack(
                children: [
                  Center(child: Icon(Icons.play_circle_fill_rounded, size: 50)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
