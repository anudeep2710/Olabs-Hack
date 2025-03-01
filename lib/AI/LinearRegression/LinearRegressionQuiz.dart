import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography

class LinearRegressionQuiz extends StatefulWidget {
  const LinearRegressionQuiz({super.key});

  @override
  State<LinearRegressionQuiz> createState() => _LinearRegressionQuizState();
}

class _LinearRegressionQuizState extends State<LinearRegressionQuiz>
    with TickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<bool?> _answers = [];
  late AnimationController _fadeController;
  late AnimationController _bounceController;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Linear Regression used for?',
      'options': [
        'Classification problems',
        'Clustering problems',
        'Predicting continuous outcomes',
        'Dimensionality reduction'
      ],
      'correctIndex': 2,
    },
    {
      'question': 'Which of these is a key assumption of Linear Regression?',
      'options': [
        'Non-linear relationships',
        'Independence of observations',
        'Categorical dependent variables',
        'No need for feature scaling'
      ],
      'correctIndex': 1,
    },
    {
      'question': 'What does the slope (m) represent in y = mx + b?',
      'options': [
        'The y-intercept',
        'The rate of change of y with respect to x',
        'The error term',
        'The number of features'
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'Which metric is commonly used to evaluate Linear Regression?',
      'options': [
        'Accuracy',
        'Mean Squared Error (MSE)',
        'F1-Score',
        'Confusion Matrix'
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'Linear Regression assumes the relationship between variables is:',
      'options': ['Non-linear', 'Exponential', 'Linear', 'Polynomial'],
      'correctIndex': 2,
    },
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _checkAnswer(int selectedIndex) {
    _bounceController.forward().then((_) => _bounceController.reverse());

    setState(() {
      bool isCorrect =
          selectedIndex == _questions[_currentQuestionIndex]['correctIndex'];
      _answers.add(isCorrect);
      if (isCorrect) {
        _score++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Correct! Great job!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Wrong! The correct answer is ${_questions[_currentQuestionIndex]['options'][_questions[_currentQuestionIndex]['correctIndex']]}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 1),
          ),
        );
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _currentQuestionIndex++;
            _fadeController.forward(from: 0.0);
          });
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500), _showResults);
      }
    });
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: _fadeController,
                child: Icon(
                  Icons.celebration,
                  color: Colors.blueAccent,
                  size: 50,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your Score: $_score / ${_questions.length}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentQuestionIndex = 0;
                    _score = 0;
                    _answers.clear();
                  });
                  Navigator.of(context).pop();
                  _fadeController.forward(from: 0.0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue.withOpacity(0.4),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.openSans().fontFamily),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontScale = (screenWidth / 375).clamp(0.5, 1.5);

    if (screenWidth > 600) {
      throw Exception(
          'This widget is designed for mobile devices only (max width 600px)');
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      backgroundColor: Colors.pink[50], // Vibrant, student-friendly background
      body: FadeTransition(
        opacity: _fadeController,
        child: Padding(
          padding: EdgeInsets.all(16.0 * fontScale),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(16.0 * fontScale),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16 * fontScale),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 8 * fontScale,
                      offset: Offset(0, 4 * fontScale),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                      style: TextStyle(
                        fontSize: 18 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                      ),
                    ),
                    SizedBox(height: 8 * fontScale),
                    Text(
                      currentQuestion['question'],
                      style: TextStyle(
                        fontSize: 22 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24 * fontScale),
              ...List.generate(
                currentQuestion['options'].length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 12 * fontScale),
                  child: ScaleTransition(
                    scale: _bounceController.drive(
                        Tween<double>(begin: 1.0, end: 1.1)
                            .chain(CurveTween(curve: Curves.easeInOut))),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _checkAnswer(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 14 * fontScale,
                            horizontal: 20 * fontScale,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12 * fontScale),
                          ),
                          elevation: 4,
                          shadowColor: Colors.blue.withOpacity(0.4),
                        ),
                        child: Text(
                          currentQuestion['options'][index],
                          style: TextStyle(
                            fontSize: 18 * fontScale,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
