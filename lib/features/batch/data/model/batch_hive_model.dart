import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

final batchHiveModelProvider = Provider(
  (ref) => BatchHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String? batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  BatchHiveModel.empty()
      : batchId = '',
        batchName = '';

// Convert hive model to entity
  BatchEntity toEntity() => BatchEntity(
        batchName: batchName,
        batchId: batchId,
      );

  // Convert Entity to hive model
  BatchHiveModel fromEntity(BatchEntity entity) => BatchHiveModel(
        batchName: entity.batchName,
        batchId: entity.batchId,
      );

  // Convert Hive List to Entity list
  List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
