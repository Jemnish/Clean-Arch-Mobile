import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';

class CourseState {
  final List<CourseEntity> lstCourses;
  final bool isLoading;
  final String? error;

  CourseState({
    required this.lstCourses,
    required this.isLoading,
    this.error,
  });
  factory CourseState.initial() {
    return CourseState(
      lstCourses: [],
      isLoading: false,
    );
  }

  CourseState copyWith({
    List<CourseEntity>? lstCourses,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      lstCourses: lstCourses ?? this.lstCourses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
