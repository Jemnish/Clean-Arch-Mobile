import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_starter/features/auth/domain/repository/i_auth_repository.dart';

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  return AuthUseCase(authRepository: ref.watch(authRepositoryProvider));
});

class AuthUseCase {
  final IAuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<Either<Failure, bool>> addStudent(AuthEntity auth) {
    return authRepository.addStudent(auth);
  }

  Future<Either<Failure, bool>> login(String username, String password) {
    return authRepository.login(username, password);
  }
}
