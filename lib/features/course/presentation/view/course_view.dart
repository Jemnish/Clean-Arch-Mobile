import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/presentation/viewmodel/course_view_model.dart';

class CourseView extends ConsumerStatefulWidget {
  const CourseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseViewState();
}

class _CourseViewState extends ConsumerState<CourseView> {
  final gap = const SizedBox(height: 8);
  final courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Add Course',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: 'Course Name',
                ),
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(courseViewModelProvider.notifier).addCourse(
                          CourseEntity(courseName: courseController.text),
                        );
                  },
                  child: const Text('Add Course'),
                ),
              ),
              gap,
              const Text(
                'List of Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              courseState.isLoading
                  ? const CircularProgressIndicator()
                  : courseState.lstCourses.isEmpty
                      ? const Text('No Courses')
                      : Expanded(
                          child: ListView.builder(
                            itemCount: courseState.lstCourses.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                      courseState.lstCourses[index].courseName),
                                  subtitle: Text(
                                      courseState.lstCourses[index].courseId!),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {},
                                  ));
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
