import 'package:flutter/material.dart';
import 'package:lms_app/components/video_list_card.dart';
import 'package:lms_app/core/app_navigations.dart';
import 'package:lms_app/view_models/videos_provider.dart';
import 'package:lms_app/views/video_details_screen.dart';
import 'package:provider/provider.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: Consumer<VideosProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }
          return ListView.builder(
            itemCount: provider.videoModels.length,
            itemBuilder: (context, index) {
              final videoModel = provider.videoModels[index];
              return VideoListCard(
                videoModel: videoModel,
                onTap: () {
                  AppNav.push(
                    context,
                    VideoDetailsScreen(videoModel: videoModel),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
