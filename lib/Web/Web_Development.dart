import 'package:flutter/material.dart';
import 'package:olabs_app/Web/CodePlayGround.dart';
import 'package:olabs_app/Web/QuizContent.dart';
import 'package:olabs_app/Web/Resources.dart';
import 'package:olabs_app/Web/StepByStepContent.dart';
import 'package:olabs_app/Web/TheoryContent.dart';

class WebDevelopmentScreen extends StatefulWidget {
  const WebDevelopmentScreen({super.key});

  @override
  State<WebDevelopmentScreen> createState() => _WebDevelopmentScreenState();
}

class _WebDevelopmentScreenState extends State<WebDevelopmentScreen> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of pages/screens for each tab
  final List<Widget> _pages = [
    const TheoryContent(), // Theory tab
    const StepByStepContent(), // Step by Step tab
    const CodePlaygroundContent(), // Code Playground tab
    const QuizContent(), // Quiz tab
    const ResourcesContent(), // Resources tab
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
          colors: [Colors.blueAccent, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        // Match the background color for consistency
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Theory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered),
              label: 'Step by Step',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: 'Code Playground',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Resources',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple, // Highlight color for selected item
          unselectedItemColor: Colors.grey[600], // Color for unselected items
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed, // Ensures all items are visible
          backgroundColor: Colors.white, // White background for consistency
          elevation: 8, // Subtle elevation for a premium look
          selectedFontSize: 14,
          unselectedFontSize: 12,
        ),
      ),
    );
  }
}

// Placeholder content widgets for each tab
