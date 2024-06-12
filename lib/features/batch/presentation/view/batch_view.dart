import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_view_model.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BatchViewState();
}

class _BatchViewState extends ConsumerState<BatchView> {
  late TextEditingController batchController;

  @override
  void initState() {
    batchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
    const gap = SizedBox(height: 8);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Add Batch',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: batchController,
                  decoration: const InputDecoration(
                    labelText: 'Batch Name',
                  ),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(batchViewModelProvider.notifier).addBatch(
                            BatchEntity(batchName: batchController.text),
                          );
                    },
                    child: const Text('Add Batch'),
                  ),
                ),
                gap,
                const Text(
                  'List of batches',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gap,
                batchState.isLoading
                    ? const CircularProgressIndicator()
                    : batchState.lstBatches.isEmpty
                        ? const Text('No Batches')
                        : Expanded(
                            child: ListView.builder(
                              itemCount: batchState.lstBatches.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(
                                        batchState.lstBatches[index].batchName),
                                    subtitle: Text(
                                        batchState.lstBatches[index].batchId!),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        
                                      },
                                    ));
                              },
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
