import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/data/data_source/batch_remote_datasource.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/batch_repository.dart';

final batchRemoteRepositoryProvider = Provider<IBatchRepository>((ref) {
  return BatchRemoteRepoImpl(
    batchRemoteDataSource: ref.read(batchRemoteDataSourceProvider),
  );
});


class BatchRemoteRepoImpl implements IBatchRepository{
  final BatchRemoteDataSource batchRemoteDataSource;

  BatchRemoteRepoImpl({required this.batchRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRemoteDataSource.addBatch(batch);
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRemoteDataSource.getAllBatches();
  }
}