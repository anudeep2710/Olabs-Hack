import 'package:flutter/material.dart';
import 'package:olabs_app/AI/LinearRegression/LinearRegressionPlay.dart';
import 'package:olabs_app/AI/LogisticRegression/QuizContent.dart';
import 'package:olabs_app/AI/LogisticRegression/ResourcesContent.dart';
import 'package:olabs_app/AI/LogisticRegression/StepByStepContent.dart';
import 'package:olabs_app/AI/LogisticRegression/TheoryContent.dart';

class LogisticRegressionScreen extends StatefulWidget {
  const LogisticRegressionScreen({super.key});

  @override
  State<LogisticRegressionScreen> createState() =>
      _LogisticRegressionScreenState();
}

class _LogisticRegressionScreenState extends State<LogisticRegressionScreen> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of pages/screens for each tab
  final List<Widget> _pages = [
    const TheoryContent(), // Theory tab
    const StepByStepContent(), // Step by Step tab
    const PlayGround(), // Code Playground tab
    const LogisticRegressionQuiz(), // Quiz tab
    ResourcesContent(), // Resources tab
  ];

  // Method to handle navigation bar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
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
          elevation: 8,
          selectedFontSize: 14,
          unselectedFontSize: 12,
        ),
      ),
    );
  }
}
