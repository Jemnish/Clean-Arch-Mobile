import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/auth/data/repository/auth_remote_repository.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.watch(authRemoteRepository);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> addStudent(AuthEntity auth);
  Future<Either<Failure, bool>> login(String username, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
