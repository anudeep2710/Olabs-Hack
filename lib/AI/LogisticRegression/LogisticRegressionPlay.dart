import 'package:flutter/material.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({super.key});

  @override
  State<PlayGround> createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Logistic Regression Playground'),
        ),
        body: Column());
  }
}
