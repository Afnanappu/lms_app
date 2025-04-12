import 'package:flutter/material.dart';
import 'package:lms_app/components/subject_card.dart';
import 'package:lms_app/core/app_navigations.dart';
import 'package:lms_app/core/constants/app_colors.dart';
import 'package:lms_app/view_models/subjects_provider.dart';
import 'package:lms_app/views/modules_screen.dart';
import 'package:lms_app/widgets/home_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: RefreshIndicator.adaptive(
        edgeOffset: 200,
        onRefresh: () async {
          context.read<SubjectProvider>().fetchSubjects(); // fetch subjects
        },
        backgroundColor: AppColors.backgroundLight,
        child: CustomScrollView(
          slivers: [
            HomeAppBar(),

            Consumer<SubjectProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.65,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  );
                }

                if (provider.errorMessage != null) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.65,
                      child: Center(child: Text(provider.errorMessage!)),
                    ),
                  );
                }
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
                          AppNav.push(
                            context,
                            ModulesScreen(subjectId: subject.id),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
