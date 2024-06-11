import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_starter/features/auth/domain/repository/i_auth_repository.dart';

final authLocalRepository = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
      authLocalDataSource: ref.read(authLocalDataSourceProvider));
});

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthLocalRepository({required this.authLocalDataSource});

  @override
  Future<Either<Failure, bool>> addStudent(AuthEntity auth) {
    return authLocalDataSource.addStudent(auth);
  }

  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    return authLocalDataSource.login(username, password);
  }
}
