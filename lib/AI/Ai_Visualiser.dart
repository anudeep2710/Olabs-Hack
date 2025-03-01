import 'package:flutter/material.dart';
import 'package:olabs_app/AI/LinearRegression/LinearRegression.dart';
import 'package:olabs_app/AI/LogisticRegression/LogisticRegression.dart';

class AIVisualizerScreen extends StatelessWidget {
  const AIVisualizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'label': 'Linear Regression',
        'color': Colors.blueAccent,
        'screen': const LinearRegressionScreen(),
      },
      {
        'label': 'Logistic Regression',
        'color': Colors.greenAccent,
        'screen': const LogisticRegressionScreen(),
      },
    ];

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
      backgroundColor: const Color(0xFFF5F7FA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => item['screen'] as Widget),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    item['label'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
