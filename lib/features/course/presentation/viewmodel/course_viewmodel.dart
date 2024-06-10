import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/common/my_snackbar.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/usecases/course_usecase.dart';
import 'package:student_management_starter/features/course/presentation/state/course_state.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>(
  (ref) => CourseViewModel(
    ref.read(courseUseCaseProvider),
  ),
);

class CourseViewModel extends StateNotifier<CourseState> {
  final CourseUseCase courseUsecase;
  CourseViewModel(this.courseUsecase) : super(CourseState.initial()) {
    getAllCourses();
  }

  deleteCourse(CourseEntity course) async {
    state.copyWith(isLoading: true);
    var data = await courseUsecase.deleteCourse(course.courseId!);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state.lstCourses.remove(course);
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(
          message: 'Course delete successfully',
        );
      },
    );
  }

  addCourse(CourseEntity course) async {
    state.copyWith(isLoading: true);
    var data = await courseUsecase.addCourse(course);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: 'Course added successfully');
      },
    );

    getAllCourses();
  }

  Future<void> getAllCourses() async {
    state = state.copyWith(isLoading: true);
    var data = await courseUsecase.getAllCourses();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, courses: r),
    );
  }
}
