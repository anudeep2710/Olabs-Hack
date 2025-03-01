import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography

class LinearRegressionTheory extends StatefulWidget {
  const LinearRegressionTheory({super.key});

  @override
  State<LinearRegressionTheory> createState() => _LinearRegressionTheoryState();
}

class _LinearRegressionTheoryState extends State<LinearRegressionTheory>
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
      backgroundColor: Colors.white, // White background as per design
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0 * fontScale),
          child: FadeTransition(
            opacity: _animationController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Linear Regression Theory',
                  style: TextStyle(
                    fontSize: 28 * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                  ),
                ),
                SizedBox(height: 24 * fontScale),
                _buildSection(
                  title: 'Overview of Linear Regression',
                  content: '''
Linear regression is a statistical method used to model the relationship between a dependent variable (target) and one or more independent variables (features). It assumes a linear relationship, expressed as:

y = mx + b

where:
- y is the dependent variable (output),
- x is the independent variable (input),
- m is the slope (coefficient),
- b is the y-intercept.

It’s widely used for prediction, forecasting, and understanding relationships in data, such as predicting house prices based on size or sales based on advertising spend. Key assumptions include linearity, independence, homoscedasticity, and normality of residuals.''',
                  bulletPoints: [
                    'Linear relationship between variables',
                    'Independence of observations',
                    'Homoscedasticity (constant variance of errors)',
                    'Normality of residuals',
                  ],
                ),
                SizedBox(height: 16 * fontScale),
                _buildCodeSnippet(
                  code: '''import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt

# Sample data
X = np.array([[1], [2], [3], [4], [5]])  # Independent variable
y = np.array([2.1, 3.8, 6.2, 7.8, 9.5])  # Dependent variable

# Create and train the model
model = LinearRegression()
model.fit(X, y)

# Make predictions
y_pred = model.predict(X)

# Print coefficients
print("Slope (m):", model.coef_[0])
print("Intercept (b):", model.intercept_)

# Plot the results
plt.scatter(X, y, color='blue', label='Data points')
plt.plot(X, y_pred, color='red', label='Linear Regression Line')
plt.xlabel('X (Independent)')
plt.ylabel('Y (Dependent)')
plt.title('Linear Regression Example')
plt.legend()
plt.show()''',
                  language: 'Python',
                ),
                SizedBox(height: 16 * fontScale),
                _buildSection(
                  title: 'Practical Applications',
                  content: '''
Linear regression is applied in various fields, such as economics, biology, and marketing. For example, it can predict crop yields based on rainfall, sales based on advertising budget, or student performance based on study hours. It’s simple yet powerful for understanding linear trends in data.''',
                  bulletPoints: [
                    'Predicting house prices from size',
                    'Forecasting sales from marketing spend',
                    'Analyzing student performance trends',
                  ],
                ),
                SizedBox(height: 16 * fontScale),
                _buildCodeSnippet(
                  code: '''from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train the model
model.fit(X_train, y_train)

# Evaluate the model
y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)''',
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
