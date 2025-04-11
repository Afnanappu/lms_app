import 'package:flutter/material.dart';
import 'package:lms_app/components/module_card.dart';
import 'package:lms_app/view_models/modules_provider.dart';
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
          return ListView.builder(
            itemCount: provider.modules.length,
            itemBuilder: (context, index) {
              final module = provider.modules[index];
              return ModuleCard(
                module: module,
                index: index,
                onTap: () {
                  //TODO:Add navigation
                },
              );
            },
          );
        },
      ),
    );
  }
}
