import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/I_batch_repository.dart';

final batchUseCaseProvider = Provider<BatchUseCase>((ref) => BatchUseCase(
      iBatchRepository: ref.read(batchRepositoryProvider),
    ));

class BatchUseCase {
  final IBatchRepository iBatchRepository;

  BatchUseCase({required this.iBatchRepository});

  // for adding a batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return iBatchRepository.addBatch(batch);
  }

  // for getting all batches
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return iBatchRepository.getAllBatches();
  }

  Future<Either<Failure, bool>> deleteBatch(BatchEntity batch) {
    return iBatchRepository.deleteBatch(batch);
  }
}
