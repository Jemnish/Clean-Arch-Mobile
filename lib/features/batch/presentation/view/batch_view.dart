import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_viewmodel.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<BatchView> createState() => _AddBatchViewState();
}

class _AddBatchViewState extends ConsumerState<BatchView> {
  final gap = const SizedBox(height: 8);
  final batchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewmodelProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Batch',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: batchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Batch Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter batch';
                  }
                  return null;
                },
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    BatchEntity batchEnity =
                        BatchEntity(batchName: batchController.text);
                    // Pass the data to ViewModel
                    ref
                        .read(batchViewmodelProvider.notifier)
                        .addBatch(batchEnity);
                  },
                  child: const Text('Add Batch'),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Batches',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Display List of batches
              if (batchState.isLoading) ...{
                const Center(child: CircularProgressIndicator()),
              } else if (batchState.error != null) ...{
                Text(batchState.error.toString()),
              } else if (batchState.lstBatches.isEmpty) ...{
                const Center(child: Text('No Batches')),
              } else ...{
                Expanded(
                  child: ListView.builder(
                    itemCount: batchState.lstBatches.length,
                    itemBuilder: (context, index) {
                      var batch = batchState.lstBatches[index];
                      return ListTile(
                        title: Text(batch.batchName),
                        subtitle: Text(batch.batchId ?? ''),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(batchViewmodelProvider.notifier)
                                .deleteBatch(batch.batchId!);
                          },
                        ),
                      );
                    },
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
