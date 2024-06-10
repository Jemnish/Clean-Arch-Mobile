import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

// Create provider for BatchLocalDataSoruce
final batchLocalDataSourceProvider = Provider(
  (ref) => BatchLocalDatSource(
    hiveService: ref.read(hiveServiceProvider), // Passing Hive Service Object
    batchHiveModel:
        ref.read(batchHiveModelProvider), // Passing BatchHiveModel Object
  ),
);

class BatchLocalDatSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDatSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  // Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      // Convert Entity to Hive Object
      final hiveBatch = batchHiveModel.fromEntity(batch);
      // Add to Hive
      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Batches
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      // Get All Batches from Hive
      final hiveBatches = await hiveService.getAllBatches();
      // Convert Hive List to Entity List
      // As the database returns BatchHiveModel
      final batches = batchHiveModel.toEntityList(hiveBatches);
      return Right(batches);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }


  // Delete Batch
  Future<Either<Failure, bool>> deleteBatch(String id) async {
    try {
      // Delete Batch from Hive
      await hiveService.deleteBatch(id);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
