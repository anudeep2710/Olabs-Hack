import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography

class QuizContent extends StatefulWidget {
  const QuizContent({super.key});

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent>
    with TickerProviderStateMixin {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What does HTML stand for?',
      'options': [
        'Hyper Text Markup Language',
        'High Tech Modern Language',
        'Hyperlink and Text Markup Language',
        'Home Tool Markup Language'
      ],
      'correctAnswer': 'Hyper Text Markup Language'
    },
    {
      'question': 'Which CSS property is used to change the text color?',
      'options': ['color', 'text-color', 'font-color', 'text-style'],
      'correctAnswer': 'color'
    },
    {
      'question': 'What is the purpose of JavaScript in web development?',
      'options': [
        'Styling webpages',
        'Adding interactivity',
        'Structuring content',
        'Managing databases'
      ],
      'correctAnswer': 'Adding interactivity'
    },
    {
      'question': 'Which HTML tag is used to create a paragraph?',
      'options': ['<p>', '<par>', '<paragraph>', '<div>'],
      'correctAnswer': '<p>'
    },
    {
      'question': 'What does CSS stand for?',
      'options': [
        'Cascading Style Sheets',
        'Creative Style System',
        'Computer Style Sheets',
        'Cascading System Styles'
      ],
      'correctAnswer': 'Cascading Style Sheets'
    },
  ];

  late int currentQuestionIndex = 0;
  Map<int, String?> userAnswers = {}; // Store user answers by question index
  int score = 0;
  bool isQuizFinished = false;
  late AnimationController _fadeController;
  late AnimationController _bounceController;

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

  void _submitAnswer(String answer) {
    _bounceController.forward().then((_) => _bounceController.reverse());

    setState(() {
      // Validate currentQuestionIndex before proceeding
      if (currentQuestionIndex >= questions.length) {
        print(
            'Warning: currentQuestionIndex ($currentQuestionIndex) exceeds questions length (${questions.length})');
        currentQuestionIndex = 0; // Reset to prevent further errors
        isQuizFinished = true;
        _showResults();
        return;
      }

      userAnswers[currentQuestionIndex] = answer;
      if (answer == questions[currentQuestionIndex]['correctAnswer']) {
        score++;
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
                'Wrong! The correct answer is ${questions[currentQuestionIndex]['correctAnswer']}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 1),
          ),
        );
      }

      if (currentQuestionIndex < questions.length - 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            currentQuestionIndex++;
            _fadeController.forward(from: 0.0);
          });
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500), _showResults);
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      // Validate and clamp currentQuestionIndex
      if (currentQuestionIndex >= questions.length - 1) {
        isQuizFinished = true;
        _showResults();
      } else {
        currentQuestionIndex =
            (currentQuestionIndex + 1).clamp(0, questions.length - 1);
        _fadeController.forward(from: 0.0);
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
                'Your Score: $score / ${questions.length}',
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
                    currentQuestionIndex = 0;
                    userAnswers.clear();
                    score = 0;
                    isQuizFinished = false;
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

    if (isQuizFinished) {
      return Center(
        child: FadeTransition(
          opacity: _fadeController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 24 * fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
              SizedBox(height: 16 * fontScale),
              Text(
                'Your Score: $score / ${questions.length}',
                style: TextStyle(
                  fontSize: 18 * fontScale,
                  color: Colors.black54,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
              SizedBox(height: 16 * fontScale),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    userAnswers.clear();
                    score = 0;
                    isQuizFinished = false;
                  });
                  _fadeController.forward(from: 0.0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: 12 * fontScale,
                    horizontal: 24 * fontScale,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12 * fontScale),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue.withOpacity(0.4),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                      fontSize: 16 * fontScale,
                      fontFamily: GoogleFonts.openSans().fontFamily),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];
    if (currentQuestionIndex >= questions.length) {
      // Fallback for invalid index
      return const Center(child: Text('Error: Invalid question index'));
    }

    final options = currentQuestion['options'] as List<dynamic>? ?? [];
    if (options.isEmpty) {
      return const Center(child: Text('Error: No options available'));
    }

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
                      'Question ${currentQuestionIndex + 1} of ${questions.length}',
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
                options.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 12 * fontScale),
                  child: ScaleTransition(
                    scale: _bounceController.drive(
                        Tween<double>(begin: 1.0, end: 1.1)
                            .chain(CurveTween(curve: Curves.easeInOut))),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            _submitAnswer(options[index] as String),
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
                          options[index] as String,
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
