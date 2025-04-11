import 'package:flutter/material.dart';
import 'package:lms_app/components/subject_card.dart';
import 'package:lms_app/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeAppBar(searchController: searchController),

          SliverGrid.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
            ),

            itemBuilder: (context, index) {
              return SubjectCard(
                image:
                    "https://trogon.info/interview/php/api/images/subjects/1.png",
                title: 'Subject $index',
                subtitle: '10 Courses',
              );
            },
          ),
        ],
      ),
    );
  }
}
