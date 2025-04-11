import 'package:flutter/material.dart';
import 'package:lms_app/constants/app_colors.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String image;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(image),
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryDarkPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
