import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/course/data/data_source/local/course_local_data_source.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/repository/course_repository.dart';

final courseLocalRepositoryProvider = Provider<ICourseRepository>(
  (ref) => CourseLocalRepositoryImpl(
    courseLocalDataSource: ref.read(courseLocalDataSourceProvider),
  ),
);

class CourseLocalRepositoryImpl implements ICourseRepository {
  final CourseLocalDataSource courseLocalDataSource;

  CourseLocalRepositoryImpl({required this.courseLocalDataSource});

  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseLocalDataSource.addCourse(course);
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseLocalDataSource.getAllCourses();
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String id) {
    // TODO: implement deleteCourse
    return courseLocalDataSource.deleteCourse(id);
  }
}
