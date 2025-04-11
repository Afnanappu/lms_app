import 'package:flutter/material.dart';
import 'package:lms_app/components/subject_card.dart';
import 'package:lms_app/view_models/subject_provider.dart';
import 'package:lms_app/widgets/home_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubjectProvider>().fetchSubjects();
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeAppBar(searchController: searchController),

          Consumer<SubjectProvider>(
            builder: (context, provider, child) {
              return SliverGrid.builder(
                itemCount: provider.subjects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),

                itemBuilder: (context, index) {
                  final subject = provider.subjects[index];
                  return Tooltip(
                    message: subject.description,
                    triggerMode: TooltipTriggerMode.longPress,
                    child: SubjectCard(
                      image: subject.image,
                      title: subject.title,
                      subtitle: subject.description,
                      onTap: () {
                        debugPrint(subject.title);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
