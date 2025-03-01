import 'package:flutter/material.dart';
import 'package:olabs_app/AI/LinearRegression/LinearRegressionPlay.dart';
import 'package:olabs_app/AI/LinearRegression/LinearRegressionQuiz.dart';
import 'package:olabs_app/AI/LinearRegression/LinearRegressionStepByStep.dart';
import 'package:olabs_app/AI/LinearRegression/LinearRegressionTheory.dart';
import 'package:olabs_app/AI/LinearRegression/ResourcesContent.dart'; // Assuming a similar placeholder for resources

class LinearRegressionScreen extends StatefulWidget {
  const LinearRegressionScreen({super.key});

  @override
  State<LinearRegressionScreen> createState() => _LinearRegressionScreenState();
}

class _LinearRegressionScreenState extends State<LinearRegressionScreen> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of pages/screens for each tab
  final List<Widget> _pages = [
    const LinearRegressionTheory(), // Theory tab
    const LinearRegressionStepByStep(), // Step by Step tab
    const PlayGround(), // Code Playground tab
    const LinearRegressionQuiz(), // Quiz tab
    ResourcesContent(), // Resources tab (assuming similar placeholder)
  ];

  // Method to handle navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale =
        (screenWidth / 375).clamp(0.5, 1.5); // Base width for mobile scaling

    if (screenWidth > 600) {
      throw Exception(
          'This widget is designed for mobile devices only (max width 600px)');
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Transparent to show gradient
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Theory'),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered), label: 'Step by Step'),
            BottomNavigationBarItem(
                icon: Icon(Icons.code), label: 'Code Playground'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: 'Resources'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey[600],
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 8 * fontScale,
          selectedFontSize: 14 * fontScale,
          unselectedFontSize: 12 * fontScale,
        ),
      ),
    );
  }
}
