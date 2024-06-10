import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';

class CourseState {
  final bool isLoading;
  final String? error;
  final List<CourseEntity> lstCourses;

  const CourseState({
    required this.isLoading,
    required this.error,
    required this.lstCourses,
  });

  factory CourseState.initial() => const CourseState(
        isLoading: false,
        error: null,
        lstCourses: [],
      );

  CourseState copyWith({
    bool? isLoading,
    String? error,
    List<CourseEntity>? courses,
  }) {
    return CourseState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lstCourses: courses ?? lstCourses,
    );
  }
}
