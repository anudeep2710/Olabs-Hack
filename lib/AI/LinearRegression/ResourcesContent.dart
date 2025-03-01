import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For typography
import 'package:http/http.dart' as http; // For HTTP requests

class ResourcesContent extends StatefulWidget {
  @override
  _ResourcesContentState createState() => _ResourcesContentState();
}

class _ResourcesContentState extends State<ResourcesContent> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _chatMessages = [];
  bool _isLoading = false;

  Future<String> _sendToGemini(String message) async {
    final uri = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyCXPq5FY2jPFpWdAP7MelOaaWUdM0WDYIM');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey('candidates') &&
          data['candidates'].isNotEmpty &&
          data['candidates'][0].containsKey('content') &&
          data['candidates'][0]['content']['parts'].isNotEmpty) {
        return data['candidates'][0]['content']['parts'][0]['text'] ??
            "No response from AI.";
      } else {
        return "Unexpected response structure.";
      }
    }
    return "Error: ${response.statusCode} - ${response.body}";
  }

  void _sendMessage() {
    if (_messageController.text.isEmpty) return;

    String userMessage = _messageController.text.trim();

    setState(() {
      _chatMessages.add({'text': userMessage, 'isUser': true});
      _isLoading = true;
      _messageController.clear();
    });

    _sendToGemini(userMessage).then((response) {
      setState(() {
        _chatMessages.add({'text': response, 'isUser': false});
        _isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        _chatMessages
            .add({'text': 'Error: Could not fetch response', 'isUser': false});
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      return Scaffold(
        body: Center(
          child: Text(
            'This chat is optimized for mobile screens. Please resize your window.',
            style: GoogleFonts.openSans(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("OLABS BOT", style: GoogleFonts.poppins(fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final message = _chatMessages[index];
                return Align(
                  alignment: message['isUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message['isUser']
                          ? Colors.deepPurple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message['text'],
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: message['isUser'] ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
