import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography

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
    double fontScale =
        (screenWidth / 375).clamp(0.5, 1.5); // Base width for mobile scaling

    if (screenWidth > 600) {
      throw Exception(
          'This widget is designed for mobile devices only (max width 600px)');
    }

    return Scaffold(
      backgroundColor: Colors.white, // White background as per your design
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0 * fontScale),
          child: FadeTransition(
            opacity: _animationController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logistic Regression Theory',
                  style: TextStyle(
                    fontSize: 28 * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                  ),
                ),
                SizedBox(height: 24 * fontScale),
                _buildSection(
                  title: 'Introduction to Logistic Regression',
                  content:
                      'Logistic regression is a statistical method used for binary or multiclass classification problems. It predicts the probability of a specific outcome (e.g., 0 or 1) based on one or more independent variables, using the logistic (sigmoid) function to map predictions to probabilities between 0 and 1. It’s widely used in machine learning for tasks like spam detection, disease prediction, and customer churn analysis.',
                ),
                SizedBox(height: 16 * fontScale),
                _buildCodeSnippet(
                  code: '''import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

# Sample data
X = np.array([[1], [2], [3], [4], [5]])  # Independent variables
y = np.array([0, 0, 1, 1, 1])  # Binary labels (0 or 1)

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create and train the model
model = LogisticRegression()
model.fit(X_train, y_train)''',
                  language: 'Python',
                ),
                SizedBox(height: 16 * fontScale),
                _buildSection(
                  title: '1. Key Concepts of Logistic Regression',
                  content:
                      'Logistic regression models the relationship between independent variables and a categorical dependent variable using the logistic function. It assumes a linear relationship in the log-odds (logit) of the probability, expressed as: logit(p) = β₀ + β₁x₁ + β₂x₂ + ..., where p is the probability, β₀ is the intercept, and β₁, β₂, etc., are coefficients.',
                  bulletPoints: [
                    'Binary or multiclass classification',
                    'Uses the sigmoid function: p = 1 / (1 + e^(-z))',
                    'Assumes independence of observations',
                    'No multicollinearity among features'
                  ],
                ),
                SizedBox(height: 16 * fontScale),
                _buildCodeSnippet(
                  code: '''# Make predictions
y_pred = model.predict(X_test)
y_prob = model.predict_proba(X_test)[:, 1]  # Probability of class 1

# Print coefficients and intercept
print("Coefficients:", model.coef_)
print("Intercept:", model.intercept_)

# Evaluate accuracy
from sklearn.metrics import accuracy_score
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)''',
                  language: 'Python',
                ),
                SizedBox(height: 16 * fontScale),
                _buildSection(
                  title: '2. Practical Applications',
                  content:
                      'Logistic regression is applied in various fields, such as healthcare, finance, and marketing. For example, it can predict whether a patient has a disease, determine credit risk, or identify customer churn based on demographic and behavioral data.',
                  bulletPoints: [
                    'Disease prediction (e.g., diabetes diagnosis)',
                    'Credit scoring for loan approvals',
                    'Customer churn prediction in marketing'
                  ],
                ),
                SizedBox(height: 16 * fontScale),
                _buildCodeSnippet(
                  code: '''from sklearn.preprocessing import StandardScaler

# Scale features for better performance
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Train model with scaled data
model = LogisticRegression()
model.fit(X_scaled, y)

# Predict with scaled data
X_test_scaled = scaler.transform(X_test)
y_pred = model.predict(X_test_scaled)''',
                  language: 'Python',
                ),
              ],
            ),
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
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

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
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

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
