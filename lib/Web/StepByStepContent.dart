import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepByStepContent extends StatefulWidget {
  const StepByStepContent({super.key});

  @override
  State<StepByStepContent> createState() => _StepByStepContentState();
}

class _StepByStepContentState extends State<StepByStepContent> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = screenWidth / 375;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0 * fontScale),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step-by-Step learning',
                    style: GoogleFonts.openSans(
                      fontSize: 26 * fontScale,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20 * fontScale),
                  _buildRoadmapStep(
                    number: 1,
                    title: 'Website Development Using HTML & CSS',
                    subtitle: 'Learn HTML & CSS basics',
                    theory: [
                      'Concept of website & its need',
                      'HTML basics',
                      'CSS fundamentals'
                    ],
                    practical: [
                      'Build a static website',
                      'Use different HTML tags'
                    ],
                    projectTitle: 'Portfolio Website',
                  ),
                  _buildRoadmapConnector(),
                  _buildRoadmapStep(
                    number: 2,
                    title: 'Cascading Style Sheets (CSS)',
                    subtitle: 'Enhancing website appearance',
                    theory: [
                      'CSS Syntax & Selectors',
                      'Box Model',
                      'Positioning & Flexbox'
                    ],
                    practical: [
                      'Styling pages with CSS',
                      'Build a responsive website'
                    ],
                    projectTitle: 'Styled Personal Website',
                  ),
                  _buildRoadmapConnector(),
                  _buildRoadmapStep(
                    number: 3,
                    title: 'Introduction to JavaScript',
                    subtitle: 'Make websites interactive',
                    theory: [
                      'JS Basics & Syntax',
                      'DOM Manipulation',
                      'Event Handling'
                    ],
                    practical: [
                      'Create interactive pages',
                      'Make a dynamic form'
                    ],
                    projectTitle: 'Interactive Todo List',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoadmapStep({
    required int number,
    required String title,
    required String subtitle,
    required List<String> theory,
    required List<String> practical,
    required String projectTitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 12),
          _buildSection('Theory', theory),
          SizedBox(height: 12),
          _buildSection('Practical', practical),
          SizedBox(height: 12),
          Text(
            'Project: $projectTitle',
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.blueAccent, size: 18),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildRoadmapConnector() {
    return Container(
      width: 5,
      height: 30,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.7),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
