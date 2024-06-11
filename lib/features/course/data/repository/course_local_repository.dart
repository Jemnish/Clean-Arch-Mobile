import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/course/data/data_source/local/course_local_source.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/repository/i_course_repository.dart';

final courseLocalRepository = Provider<ICourseRepository>((ref) {
  return CourseLocalRepository(
      courseLocalDataSource: ref.read(courseLocalSourceProvider));
});

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalSource courseLocalDataSource;

  CourseLocalRepository({required this.courseLocalDataSource});

  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseLocalDataSource.addCourse(course);
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseLocalDataSource.getAllCourses();
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(CourseEntity course) {
    return courseLocalDataSource.deleteCourse(course);
  }
}
