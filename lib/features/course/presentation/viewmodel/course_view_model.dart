import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/usecases/course_usecase.dart';
import 'package:student_management_starter/features/course/presentation/state/course_state.dart';
import 'package:student_management_starter/features/course/presentation/widgets/show_my_snackbar.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>(
        (ref) => CourseViewModel(ref.read(courseUseCaseProvider)));

class CourseViewModel extends StateNotifier<CourseState> {
  CourseViewModel(this.courseUseCase) : super(CourseState.initial()) {
    getAllCourses();
  }

  final CourseUseCase courseUseCase;

  addCourse(CourseEntity course) async {
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.addCourse(course);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Course Added Successfully');
    });

    getAllCourses();
  }

  deleteCourse(CourseEntity course) async {
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.deleteCourse(course);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Course Deleted Successfully');
    });

    getAllCourses();
  }

  // for getting all courses
  getAllCourses() async {
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.getAllCourses();
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    }, (r) {
      state = state.copyWith(isLoading: false, lstCourses: r, error: null);
    });
  }
}
