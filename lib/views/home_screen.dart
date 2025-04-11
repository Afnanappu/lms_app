import 'package:flutter/material.dart';
import 'package:lms_app/components/subject_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   backgroundColor: Color(0xFF4b17cd),
          //   collapsedHeight: kToolbarHeight,
          //   expandedHeight: 300,
          //   flexibleSpace: FlexibleSpaceBar(background: FlutterLogo()),
          // ),
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
