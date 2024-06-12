import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/course/data/model/course_hive_model.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';

// Provider
final courseLocalSourceProvider = Provider((ref) => CourseLocalSource(
      hiveService: ref.read(hiveServiceProvider),
      courseHiveModel: ref.read(courseHiveModelProvider),
    ));

class CourseLocalSource {
  final HiveService hiveService;
  final CourseHiveModel courseHiveModel;

  CourseLocalSource({
    required this.hiveService,
    required this.courseHiveModel,
  });

  // Add Course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      // Convert Entity to Hive Object
      final hiveCourse = courseHiveModel.fromEntity(course);

      // Add to Hive
      await hiveService.addCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      // Get all Courses from Hive
      final hiveCourses = await hiveService.getAllCourses();

      // Convert Hive List to Entry list
      final courses = courseHiveModel.toEntityList(hiveCourses);

      return Right(courses);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Delete Course
  Future<Either<Failure, bool>> deleteCourse(CourseEntity course) async {
    try {
      // Convert Entity to Hive Object
      final hiveCourse = courseHiveModel.fromEntity(course);

      // Add to Hive
      await hiveService.deleteCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
