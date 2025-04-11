import 'package:flutter/material.dart';
import 'package:lms_app/view_models/modules_provider.dart';
import 'package:provider/provider.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modules')),
      body: Consumer<ModulesProvider>(
        builder: (context, value, child) {
          return const Center(child: Text('Modules Screen'));
        },
      ),
    );
  }
}
