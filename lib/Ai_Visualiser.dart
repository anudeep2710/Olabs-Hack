import 'package:flutter/material.dart';

class AIVisualizerScreen extends StatelessWidget {
  const AIVisualizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI/ML Visualizer'),
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(
          0xFFF5F7FA), // Match the background color of TechnologyScreen for consistency
      body: const Center(
        child: Text(
          'AI/ML Visualizer Content Here',
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ),
    );
  }
}
