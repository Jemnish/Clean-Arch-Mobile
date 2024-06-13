import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/auth/data/model/auth_hive_model.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';

final authLocalDataSourceProvider = Provider((ref) => AuthLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    authHiveModel: ref.read(authHiveModelProvider)));

class AuthLocalDataSource {
  final HiveService hiveService;
  final AuthHiveModel authHiveModel;

  AuthLocalDataSource({required this.hiveService, required this.authHiveModel});

  // Add Student
  Future<Either<Failure, bool>> addStudent(AuthEntity auth) async {
    try {
      // If already username throw error
      final hiveStudent = authHiveModel.toHiveModel(auth);

      await hiveService.addStudent(hiveStudent);

      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get Student
  Future<Either<Failure, AuthEntity>> getStudent(String username) async {
    try {
      final hiveStudent = await hiveService.getStudent(username);

      final student = hiveStudent.toEntity();

      return Right(student);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Login
  Future<Either<Failure, bool>> login(String username, String password) async {
    try {
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
