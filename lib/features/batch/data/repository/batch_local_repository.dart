import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/data/data_source/local/batch_local_datasource.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/I_batch_repository.dart';

final batchLocalRepository = Provider<IBatchRepository>(
  (ref) {
    return BatchLocalRepository(
        batchLocalDataSource: ref.read(batchLocalDataSourceProvider));
  },
);

class BatchLocalRepository implements IBatchRepository {
  final BatchLocalDataSource batchLocalDataSource;

  BatchLocalRepository({required this.batchLocalDataSource});
  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchLocalDataSource.addBatch(batch);
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchLocalDataSource.getAllBatches();
  }

  @override
  Future<Either<Failure, bool>> deleteBatch(BatchEntity batch) {
    return batchLocalDataSource.deleteBatch(batch);
  }
}
