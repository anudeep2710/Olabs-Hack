import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodePlaygroundContent extends StatefulWidget {
  const CodePlaygroundContent({super.key});

  @override
  State<CodePlaygroundContent> createState() => _CodePlaygroundContentState();
}

class _CodePlaygroundContentState extends State<CodePlaygroundContent>
    with SingleTickerProviderStateMixin {
  final TextEditingController _htmlController = TextEditingController();
  final TextEditingController _cssController = TextEditingController();
  final TextEditingController _jsController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadSavedCode();
  }

  Future<void> _loadSavedCode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _htmlController.text =
          prefs.getString('html_code') ?? '<h1>Hello, Web Development!</h1>';
      _cssController.text = prefs.getString('css_code') ??
          'body { background-color: #1e1e1e; color: white; text-align: center; }';
      _jsController.text = prefs.getString('js_code') ??
          'function greet() { alert("Welcome!"); } greet();';
    });
  }

  Future<void> _saveCode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('html_code', _htmlController.text);
    await prefs.setString('css_code', _cssController.text);
    await prefs.setString('js_code', _jsController.text);
  }

  void _navigateToOutput() {
    _saveCode(); // Save the code before running
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebOutputScreen(htmlContent: _generateHtml()),
      ),
    );
  }

  String _generateHtml() {
    return '''
<!DOCTYPE html>
<html>
<head>
  <title>Code Playground</title>
  <style>${_cssController.text}</style>
</head>
<body>
  <div id="content">${_htmlController.text}</div>
  <script>${_jsController.text}</script>
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Playground'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: _navigateToOutput,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Run Code'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'HTML'),
            Tab(text: 'CSS'),
            Tab(text: 'JavaScript'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCodeEditor(_htmlController, 'HTML', Icons.code),
                _buildCodeEditor(_cssController, 'CSS', Icons.palette),
                _buildCodeEditor(_jsController, 'JavaScript', Icons.memory),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeEditor(
      TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              maxLines: 8,
              style: const TextStyle(
                fontFamily: 'Courier',
                fontSize: 14,
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCodeEditor(
    TextEditingController controller, String label, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 16.0, horizontal: 24.0), // Increased outer padding
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom header with icon
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 16), // Increased header padding
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24), // Increased icon size
              const SizedBox(width: 16), // Increased spacing
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Text field with rounded corners
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: 150, // Increased line count
            style: const TextStyle(
              fontSize: 16, // Increased font size
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16), // Increased content padding
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}

class WebOutputScreen extends StatefulWidget {
  final String htmlContent;

  const WebOutputScreen({super.key, required this.htmlContent});

  @override
  State<WebOutputScreen> createState() => _WebOutputScreenState();
}

class _WebOutputScreenState extends State<WebOutputScreen> {
  late WebViewController _webViewController;
  bool canGoBack = false;
  bool canGoForward = false;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(widget.htmlContent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => _updateNavigationButtons(),
        ),
      );
  }

  void _updateNavigationButtons() async {
    bool back = await _webViewController.canGoBack();
    bool forward = await _webViewController.canGoForward();
    setState(() {
      canGoBack = back;
      canGoForward = forward;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // **Browser Header (Address Bar & Controls)**
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.grey[200],
            child: Row(
              children: [
                // Back Button
                IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: canGoBack ? Colors.black : Colors.grey),
                  onPressed: canGoBack
                      ? () async {
                          await _webViewController.goBack();
                          _updateNavigationButtons();
                        }
                      : null,
                ),
                // Forward Button
                IconButton(
                  icon: Icon(Icons.arrow_forward,
                      color: canGoForward ? Colors.black : Colors.grey),
                  onPressed: canGoForward
                      ? () async {
                          await _webViewController.goForward();
                          _updateNavigationButtons();
                        }
                      : null,
                ),
                // Refresh Button
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.black),
                  onPressed: () async {
                    await _webViewController.reload();
                  },
                ),
                // Address Bar (Static for localhost)
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'localhost/playground',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // **WebView Content**
          Expanded(child: WebViewWidget(controller: _webViewController)),
        ],
      ),
    );
  }
}
