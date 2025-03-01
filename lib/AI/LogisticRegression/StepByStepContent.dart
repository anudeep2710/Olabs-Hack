import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography

class StepByStepContent extends StatefulWidget {
  const StepByStepContent({super.key});

  @override
  State<StepByStepContent> createState() => _StepByStepContentState();
}

class _StepByStepContentState extends State<StepByStepContent>
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
    double fontScale =
        (screenWidth / 375).clamp(0.5, 1.5); // Base width for mobile scaling

    if (screenWidth > 600) {
      throw Exception(
          'This widget is designed for mobile devices only (max width 600px)');
    }

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
              child: FadeTransition(
                opacity: _animationController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Step-by-Step Logistic Regression Learning',
                      style: GoogleFonts.openSans(
                        fontSize: 26 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20 * fontScale),
                    _buildRoadmapStep(
                      number: 1,
                      title: 'Understand Logistic Regression Basics',
                      subtitle: 'Learn the fundamentals of logistic regression',
                      theory: [
                        'Concept of logistic regression for classification',
                        'Difference from linear regression',
                        'Logistic (sigmoid) function'
                      ],
                      practical: ['Identify binary classification problems'],
                      projectTitle: 'Binary Classification Model',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 2,
                      title: 'Prepare Your Data',
                      subtitle: 'Organize data for logistic regression',
                      theory: [
                        'Features (independent variables) and outcome (dependent variable)',
                        'Handling categorical data with one-hot encoding'
                      ],
                      practical: [
                        'Format data as [Study Hours, Passed (0/1)]',
                        'data = [[2, 0], [3, 0], [4, 1], [5, 1]]'
                      ],
                      projectTitle: 'Data Preparation Dataset',
                      codeSnippet: '''import numpy as np
data = np.array([[2, 0], [3, 0], [4, 1], [5, 1]])
X = data[:, 0].reshape(-1, 1)  # Features (hours)
y = data[:, 1]  # Labels (pass/fail)''',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 3,
                      title: 'Train the Model',
                      subtitle: 'Teach the computer patterns in your data',
                      theory: [
                        'Using sklearn for logistic regression',
                        'Training with fit() method'
                      ],
                      practical: ['Train model on prepared data'],
                      projectTitle: 'Trained Logistic Model',
                      codeSnippet:
                          '''from sklearn.linear_model import LogisticRegression
model = LogisticRegression()
model.fit(X, y)''',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 4,
                      title: 'Make Predictions',
                      subtitle: 'Use the model to predict outcomes',
                      theory: [
                        'Predicting probabilities and classes',
                        'Interpreting model outputs'
                      ],
                      practical: [
                        'Predict for new data points (e.g., 3.5 hours)'
                      ],
                      projectTitle: 'Prediction System',
                      codeSnippet: '''# Predict for 3.5 hours
prediction = model.predict([[3.5]])
probability = model.predict_proba([[3.5]])[:, 1]
print("Prediction:", prediction[0])
print("Probability of class 1:", probability[0])''',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 5,
                      title: 'Check Accuracy',
                      subtitle: 'Evaluate model performance',
                      theory: [
                        'Using accuracy_score for evaluation',
                        'Understanding metrics like precision and recall'
                      ],
                      practical: ['Measure accuracy on test data'],
                      projectTitle: 'Model Evaluation Report',
                      codeSnippet: '''from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
model.fit(X_train, y_train)
predictions = model.predict(X_test)
accuracy = accuracy_score(y_test, predictions)
print("Accuracy:", accuracy)''',
                    ),
                  ],
                ),
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
    String? codeSnippet,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 20 * fontScale),
      padding: EdgeInsets.all(16.0 * fontScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15 * fontScale),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8 * fontScale,
            offset: Offset(0, 4 * fontScale),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20 * fontScale,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 18 * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10 * fontScale),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 20 * fontScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8 * fontScale),
          Text(
            subtitle,
            style: GoogleFonts.openSans(
              fontSize: 16 * fontScale,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 12 * fontScale),
          _buildSection('Theory', theory),
          SizedBox(height: 12 * fontScale),
          _buildSection('Practical', practical),
          if (codeSnippet != null) ...[
            SizedBox(height: 12 * fontScale),
            _buildCodeSnippet(codeSnippet),
          ],
          SizedBox(height: 12 * fontScale),
          Text(
            'Project: $projectTitle',
            style: GoogleFonts.openSans(
              fontSize: 16 * fontScale,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 18 * fontScale,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6 * fontScale),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 4 * fontScale),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle,
                          color: Colors.blueAccent, size: 18 * fontScale),
                      SizedBox(width: 6 * fontScale),
                      Expanded(
                        child: Text(
                          item,
                          style: GoogleFonts.openSans(
                            fontSize: 14 * fontScale,
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
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

    return Container(
      width: 5 * fontScale,
      height: 30 * fontScale,
      margin: EdgeInsets.symmetric(
          vertical: 10 * fontScale, horizontal: 35 * fontScale),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.7),
        borderRadius: BorderRadius.circular(5 * fontScale),
      ),
    );
  }

  Widget _buildCodeSnippet(String code) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

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
            'Python',
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
