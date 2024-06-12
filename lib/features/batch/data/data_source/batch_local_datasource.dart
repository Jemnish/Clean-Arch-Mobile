import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/local/hive_service.dart';
import 'package:student_management_starter/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

//  Provider for batch local data source
final batchLocalDataSourceProvider = Provider(
  (ref) => BatchLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    batchHiveModel:
        ref.read(batchHiveModelProvider), // passing batchHiveModel object
  ),
);

class BatchLocalDataSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  // Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      // Convert Entity to Hive Object
      final hiveBatch = batchHiveModel.fromEntity(batch);

      // Convert Hive List to Entry list
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
      // Get all Batches from Hive
      final hiveBatches = await hiveService.getAllBatches();

      // Convert Hive List to Entry list
      final batches = batchHiveModel.toEntityList(hiveBatches);

      return Right(batches);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteBatch(BatchEntity batch) async {
    try {
      // Delete batches from Hive
      final hiveBatch = batchHiveModel.fromEntity(batch);

      await hiveService.deleteBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
