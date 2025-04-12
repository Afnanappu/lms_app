import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.searchController});

  final SearchController searchController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xFF4b17cd),
      expandedHeight: 165,
      // expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Background image
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                'assets/app_bar_bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              color: AppColors.buttonText,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //TODO: Add time based greeting
                          Text(
                            'Good Afternoon',
                            style: TextStyle(
                              color: AppColors.buttonText,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search bar
                  SearchBar(
                    hintText: 'Search Here',
                    controller: searchController,
                    backgroundColor: WidgetStateProperty.resolveWith(
                      (_) => AppColors.cardBackground,
                    ),
                    constraints: BoxConstraints(maxHeight: 60),
                    textStyle: WidgetStateProperty.resolveWith(
                      (_) => TextStyle(color: AppColors.textLight),
                    ),
                    trailing: [
                      IconButton(
                        icon: Icon(Icons.search, color: AppColors.textLight),
                        onPressed: () {},
                      ),
                    ],
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
