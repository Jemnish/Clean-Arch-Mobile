import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/repository/i_course_repository.dart';

final courseUseCaseProvider = Provider<CourseUseCase>((ref) =>
    CourseUseCase(courseRepository: ref.read(courseRepositoryProvider)));

class CourseUseCase {
  final ICourseRepository courseRepository;

  CourseUseCase({required this.courseRepository});

  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRepository.addCourse(course);
  }

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRepository.getAllCourses();
  }

  Future<Either<Failure, bool>> deleteCourse(CourseEntity course) {
    return courseRepository.deleteCourse(course);
  }
}
