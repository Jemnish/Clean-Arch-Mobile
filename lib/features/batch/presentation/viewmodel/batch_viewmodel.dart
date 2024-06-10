import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/common/my_snackbar.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/usecases/batch_usecase.dart';
import 'package:student_management_starter/features/batch/presentation/state/batch_state.dart';

final batchViewmodelProvider =
    StateNotifierProvider<BatchViewmodel, BatchState>(
  (ref) {
    return BatchViewmodel(ref.read(batchUsecaseProvider));
  },
);

class BatchViewmodel extends StateNotifier<BatchState> {
  BatchViewmodel(this.batchUseCase) : super(BatchState.initial()) {
    getAllBatches();
  }

  final BatchUseCase batchUseCase;

  addBatch(BatchEntity batch) async {
    // To show the progress bar
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Batch added successfully");
      },
    );

    getAllBatches();
  }

  // For getting all batches
  getAllBatches() async {
    // To show the progress bar
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.getAllBatches();

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, lstBatches: r, error: null);
      },
    );
  }


  // For deleting a batch
  deleteBatch(String id) async {
    // To show the progress bar
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.deleteBatch(id);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Batch deleted successfully");
      },
    );

    getAllBatches();
  }

  //Navigation
}
