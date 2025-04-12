import 'package:flutter/material.dart';
import 'package:lms_app/components/video_list_card.dart';
import 'package:lms_app/view_models/videos_provider.dart';
import 'package:provider/provider.dart';

class ModuleDetailsScreen extends StatelessWidget {
  const ModuleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: Consumer<VideosProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.videoModels.length,
            itemBuilder: (context, index) {
              final videoModel = provider.videoModels[index];
              return VideoListCard(
                videoModel: videoModel,
                onTap: () {
                  //TODO: Navigate to video screen
                },
              );
            },
          );
        },
      ),
    );
  }
}
