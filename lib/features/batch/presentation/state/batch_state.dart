import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final List<BatchEntity> lstBatches;
  final bool isLoading;
  final String? error;

  BatchState({
    required this.lstBatches,
    required this.isLoading,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(
      lstBatches: [],
      isLoading: false,
    );
  }

  BatchState copyWith({
    List<BatchEntity>? lstBatches,
    bool? isLoading,
    String? error,
  }) {
    return BatchState(
      lstBatches: lstBatches ?? this.lstBatches,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
