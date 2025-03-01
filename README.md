Here’s the GitHub README file in Markdown (`.md`) format for the "Online Labs" (or "Code Playground") project, based on the summary you provided and the screenshots. This README is concise, professional, and tailored for a Flutter-based educational mobile app focused on technical subjects like linear and logistic regression, AI/ML, and web development.

---

# Online Labs (Code Playground)

![Online Labs Screenshot](https://github.com/your-username/online-labs/raw/main/assets/screenshot.png)  
*Note: Replace with an actual screenshot or image URL from your repository*

## Description

Online Labs (or Code Playground) is an educational mobile app built with Flutter, designed for interactive learning of technical subjects such as linear regression, logistic regression, AI/ML, and web development. It features a clean, modern, student-friendly UI optimized for mobile devices (up to 600px width), with a home screen of subject cards, subject-specific screens for theory, step-by-step learning, coding, quizzes, and resources. The app’s navigation, responsiveness, and engaging design make it an effective tool for students on smartphones, encouraging hands-on exploration and mastery of complex topics.

## Features

- **Interactive Learning**: Explore subjects through theory, step-by-step guides, coding exercises, quizzes, and resources.
- **Subject-Specific Modules**: Navigate cards for Linear Regression, Logistic Regression, AI/ML, Web Development, and more.
- **Clean, Modern UI**: Uses pastel colors (blue, green, orange, pink, purple) for a student-friendly, visually appealing design.
- **Responsive Design**: Optimized for mobile devices (max 600px) with scalable layouts and fonts.
- **Navigation**: Includes a bottom navigation bar (Theory, Step by Step, Code Playground, Quiz, Resources) for seamless access.
- **Engagement**: Features interactive quizzes, code editors, and concise theory for hands-on learning.

## Screenshots

| Home Screen (Subject Selection) | Linear Regression Theory | Code Playground (Web Development) |
|-------------------------------|-------------------------|-----------------------------------|
| ![Home Screen](https://github.com/your-username/online-labs/raw/main/assets/home_screen.png) | ![Theory Screen](https://github.com/your-username/online-labs/raw/main/assets/theory_screen.png) | ![Code Playground](https://github.com/your-username/online-labs/raw/main/assets/code_playground.png) |

*Note: Replace image URLs with actual paths to screenshots in your repository.*

## Installation

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio or Xcode for mobile development
- Internet connection for API calls (Google Gemini API)

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/online-labs.git
   cd online-labs
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure the Google Gemini API:
   - Obtain an API key from Google AI Studio or Google Cloud Console (enable the Gemini API).
   - Store the API key securely in `lib/secrets.dart` or use `flutter_secure_storage`:
     ```dart
     const String geminiApiKey = 'AIzaSyBWUIapXXs-lS7ewwQl6KgT5cH5GDXE-QA'; // Replace with your key
     ```
   - For production, use `flutter_secure_storage` or `flutter_dotenv` to avoid hardcoding.

4. Add assets (e.g., icons, images) to `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/
   ```

5. Run the app:
   ```bash
   flutter run
   ```

## Usage
- Launch the app on a mobile device or emulator.
- Tap a subject card on the home screen (e.g., "Linear Regression," "Logistic Regression") to access learning modules.
- Use the bottom navigation to explore:
  - **Theory**: Read concise explanations of concepts.
  - **Step by Step**: Follow guided learning paths with practical tasks.
  - **Code Playground**: Write and run code interactively.
  - **Quiz**: Test knowledge with multiple-choice questions.
  - **Resources**: Access additional materials or links.

## Technologies
- **Flutter**: Cross-platform mobile framework for Android and iOS.
- **Google Generative AI**: Powers interactive responses via the Gemini API (e.g., `gemini-1.5-flash`).
- **Google Fonts**: Uses `google_fonts` for consistent typography (e.g., Open Sans).
- **Flutter Secure Storage**: Optionally secures the Gemini API key.

## Contributing
We welcome contributions to improve Online Labs! Follow these steps:
1. Fork the repository.
2. Create a branch:
   ```bash
   git checkout -b feature/your-feature
   ```
3. Commit changes:
   ```bash
   git commit -m "Add your feature description"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature
   ```
5. Submit a pull request.

Please adhere to Dart/Flutter coding guidelines and include tests for new features.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
- **Author**: [Your Name or Organization]
- **Email**: [your-email@example.com]
- **GitHub**: [https://github.com/your-username/online-labs]

---

### Notes
- Replace `your-username`, `your-email@example.com`, and image URLs with your actual information and assets.
- Ensure the Gemini API key (`AIzaSyBWUIapXXs-lS7ewwQl6KgT5cH5GDXE-QA`) is valid and enabled in Google AI Studio or Google Cloud Console.
- Add screenshots or assets to the `assets` folder and update `pubspec.yaml` accordingly.
- For production, secure the API key using `flutter_secure_storage` or `flutter_dotenv` to avoid hardcoding.

This README is in `.md` format, ready to be saved as `README.md` in your GitHub repository, providing a clear, concise overview of the Online Labs project. Let me know if you’d like to customize it further or add specific details!
