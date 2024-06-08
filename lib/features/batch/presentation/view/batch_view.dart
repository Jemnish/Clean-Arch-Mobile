import 'package:flutter/material.dart';

batchView() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: <Widget>[
        const TextField(
          decoration: InputDecoration(
            labelText: 'Batch Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Add batch logic here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(double.infinity, 50), // Full width button
          ),
          child: const Text('Add Batch'),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'List of Batches',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Placeholder for list of batches
      ],
    ),
  );
}
