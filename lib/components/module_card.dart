import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/models/module_model.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    super.key,
    required this.module,
    required this.index,
    this.onTap,
  });

  final ModuleModel module;
  final void Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          module.title,
          style: TextStyle(
            color: AppColors.accentBlue,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          module.description,
          style: TextStyle(fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Text(
          '${index + 1}',
          style: TextStyle(
            color: AppColors.accentBlue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Icon(Icons.book, color: AppColors.accentBlue, size: 24),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 20,
          color: AppColors.accentBlue,
        ),
      ),
    );
  }
}
