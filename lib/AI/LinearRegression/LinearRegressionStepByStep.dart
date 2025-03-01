import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography

class LinearRegressionStepByStep extends StatefulWidget {
  const LinearRegressionStepByStep({super.key});

  @override
  State<LinearRegressionStepByStep> createState() =>
      _LinearRegressionStepByStepState();
}

class _LinearRegressionStepByStepState extends State<LinearRegressionStepByStep>
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
                      'Step-by-Step Linear Regression Learning',
                      style: GoogleFonts.openSans(
                        fontSize: 26 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20 * fontScale),
                    _buildRoadmapStep(
                      number: 1,
                      title: 'Understand Linear Regression Basics',
                      subtitle: 'Learn the fundamentals of linear regression',
                      theory: [
                        'Concept of linear regression for prediction',
                        'Linear equation: y = mx + b',
                        'Key assumptions (linearity, independence)'
                      ],
                      practical: ['Identify linear relationships in data'],
                      projectTitle: 'Linear Prediction Model',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 2,
                      title: 'Prepare Your Data',
                      subtitle: 'Organize data for linear regression',
                      theory: [
                        'Features (independent variables) and outcome (dependent variable)',
                        'Handling continuous data'
                      ],
                      practical: [
                        'Format data as [Hours Studied, Test Score]',
                        'data = [[2, 50], [3, 60], [4, 70], [5, 80]]'
                      ],
                      projectTitle: 'Data Preparation Dataset',
                      codeSnippet: '''import numpy as np
data = np.array([[2, 50], [3, 60], [4, 70], [5, 80]])
X = data[:, 0].reshape(-1, 1)  # Features (hours)
y = data[:, 1]  # Labels (scores)''',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 3,
                      title: 'Train the Model',
                      subtitle: 'Teach the computer patterns in your data',
                      theory: [
                        'Using sklearn for linear regression',
                        'Training with fit() method'
                      ],
                      practical: ['Train model on prepared data'],
                      projectTitle: 'Trained Linear Model',
                      codeSnippet:
                          '''from sklearn.linear_model import LinearRegression
model = LinearRegression()
model.fit(X, y)''',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 4,
                      title: 'Make Predictions',
                      subtitle: 'Use the model to predict outcomes',
                      theory: [
                        'Predicting continuous values',
                        'Interpreting slope and intercept'
                      ],
                      practical: [
                        'Predict for new data points (e.g., 3.5 hours)'
                      ],
                      projectTitle: 'Prediction System',
                      codeSnippet: '''# Predict for 3.5 hours
prediction = model.predict([[3.5]])
print("Predicted score for 3.5 hours:", prediction[0])''',
                    ),
                    _buildRoadmapConnector(),
                    _buildRoadmapStep(
                      number: 5,
                      title: 'Check Accuracy',
                      subtitle: 'Evaluate model performance',
                      theory: [
                        'Using Mean Squared Error (MSE) for evaluation',
                        'Understanding R-squared for model fit'
                      ],
                      practical: ['Measure MSE and R-squared on test data'],
                      projectTitle: 'Model Evaluation Report',
                      codeSnippet:
                          '''from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
model.fit(X_train, y_train)
predictions = model.predict(X_test)
mse = mean_squared_error(y_test, predictions)
r2 = r2_score(y_test, predictions)
print("Mean Squared Error:", mse)
print("R-squared:", r2)''',
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
