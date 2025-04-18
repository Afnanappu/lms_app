import 'package:flutter/material.dart';
import 'package:lms_app/components/module_card.dart';
import 'package:lms_app/core/app_navigations.dart';
import 'package:lms_app/view_models/modules_provider.dart';
import 'package:lms_app/view_models/videos_provider.dart';
import 'package:lms_app/views/videos_screen.dart';
import 'package:provider/provider.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key, required this.subjectId});
  final int subjectId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ModulesProvider>().fetchModules(subjectId);
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Modules')),
      body: Consumer<ModulesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }
          return ListView.builder(
            itemCount: provider.modules.length,
            itemBuilder: (context, index) {
              final module = provider.modules[index];
              return ModuleCard(
                module: module,
                index: index,
                onTap: () {
                  context.read<VideosProvider>().fetchVideoModels(module.id);
                  AppNav.push(context, VideosScreen());
                },
              );
            },
          );
        },
      ),
    );
  }
}
