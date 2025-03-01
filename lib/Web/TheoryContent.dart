import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TheoryContent extends StatefulWidget {
  const TheoryContent({super.key});

  @override
  State<TheoryContent> createState() => _TheoryContentState();
}

class _TheoryContentState extends State<TheoryContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 375; // Base width for mobile scaling

    if (screenWidth > 600) {
      throw Exception(
          'This widget is designed for mobile devices only (max width 600px)');
    }

    return Scaffold(
      backgroundColor: Colors.white, // Light pink background for consistency
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0 * fontScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Web Development Theory',
                style: TextStyle(
                  fontSize: 28 * fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
              SizedBox(height: 24 * fontScale),
              _buildSection(
                title: 'Introduction to Web Development',
                content:
                    'Web development refers to the process of creating websites and web applications. It involves front-end, back-end, and full-stack development.',
              ),
              SizedBox(height: 16 * fontScale),
              _buildCodeSnippet(
                code: '''<!DOCTYPE html>
<html>
<head>
  <title>My Website</title>
</head>
<body>
  <h1>Welcome to Web Development!</h1>
</body>
</html>''',
                language: 'HTML',
              ),
              SizedBox(height: 16 * fontScale),
              _buildSection(
                title: '1. HTML - Structure of Web Pages',
                content:
                    'HTML (HyperText Markup Language) is the backbone of web pages. It structures content using elements like headings, paragraphs, lists, images, and links.',
                bulletPoints: [
                  'HTML Elements: <h1> to <h6>, <p>, <a>, <img>, <ul>, <ol>',
                  'Forms and Inputs: <form>, <input>, <button>, <textarea>',
                  'Tables and Lists: <table>, <tr>, <td>, <th>, <ul>, <li>'
                ],
              ),
              SizedBox(height: 16 * fontScale),
              _buildCodeSnippet(
                code: '''<h1>Heading 1</h1>
<p>This is a paragraph with a <a href="https://example.com">link</a>.</p>
<ul>
  <li>List item 1</li>
  <li>List item 2</li>
</ul>''',
                language: 'HTML',
              ),
              SizedBox(height: 16 * fontScale),
              _buildSection(
                title: '2. CSS - Styling Web Pages',
                content:
                    'CSS (Cascading Style Sheets) is used to style and layout web pages. It controls colors, fonts, spacing, positioning, and responsiveness.',
                bulletPoints: [
                  'Selectors: Class, ID, Element, Grouping, Pseudo-classes',
                  'Box Model: Margin, Padding, Border, Content',
                  'Flexbox and Grid for Layouts'
                ],
              ),
              SizedBox(height: 16 * fontScale),
              _buildCodeSnippet(
                code: '''body {
  background-color: #f0f0f0;
  font-family: Arial, sans-serif;
  color: #333;
}

h1 {
  color: #ff4444;
  text-align: center;
}''',
                language: 'CSS',
              ),
              SizedBox(height: 16 * fontScale),
              _buildSection(
                title: '3. JavaScript - Making Web Pages Interactive',
                content:
                    'JavaScript (JS) is a programming language that enables interactive and dynamic elements on websites, such as animations, form validation, and API calls.',
                bulletPoints: [
                  'Variables and Data Types',
                  'Functions and Event Listeners',
                  'DOM Manipulation and AJAX'
                ],
              ),
              SizedBox(height: 16 * fontScale),
              _buildCodeSnippet(
                code: '''function greet(name) {
  alert("Hello, " + name + "!");
}

document.getElementById("myButton").addEventListener("click", greet("User"));''',
                language: 'JavaScript',
              ),
              SizedBox(height: 16 * fontScale),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    List<String>? bulletPoints,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 375;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      padding: EdgeInsets.all(16.0 * fontScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * fontScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6 * fontScale,
            offset: Offset(0, 2 * fontScale),
          ),
        ],
        border: Border.all(color: Colors.grey[300]!, width: 1 * fontScale),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20 * fontScale,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
          SizedBox(height: 12 * fontScale),
          Text(
            content,
            style: TextStyle(
              fontSize: 16 * fontScale,
              color: Colors.black87,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
          if (bulletPoints != null && bulletPoints.isNotEmpty)
            SizedBox(height: 12 * fontScale),
          if (bulletPoints != null && bulletPoints.isNotEmpty)
            _buildBulletPoints(bulletPoints),
        ],
      ),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 375;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8 * fontScale),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontSize: 16 * fontScale,
                  color: Colors.black87,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
              Expanded(
                child: Text(
                  point,
                  style: TextStyle(
                    fontSize: 16 * fontScale,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCodeSnippet({
    required String code,
    required String language,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 375;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      padding: EdgeInsets.all(16.0 * fontScale),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9), // Dark background for code
        borderRadius: BorderRadius.circular(12 * fontScale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8 * fontScale,
            offset: Offset(0, 4 * fontScale),
          ),
        ],
        border: Border.all(
            color: Colors.blueAccent.withOpacity(0.2), width: 1 * fontScale),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language,
            style: TextStyle(
              fontSize: 16 * fontScale,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
          SizedBox(height: 8 * fontScale),
          Container(
            padding: EdgeInsets.all(12.0 * fontScale),
            decoration: BoxDecoration(
              color: Colors.black87, // Slightly lighter for code contrast
              borderRadius: BorderRadius.circular(8 * fontScale),
            ),
            child: Text(
              code,
              style: TextStyle(
                fontSize: 14 * fontScale,
                color: Colors.white,
                fontFamily: 'Courier', // Monospace for code readability
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
