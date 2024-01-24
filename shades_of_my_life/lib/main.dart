import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int shade = 255;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: GestureDetector(onVerticalDragUpdate: (details) {
          setState(() {
            double height = MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top;
            shade = (details.localPosition.dy / height * 16777215).round();
          });
          if (shade < 0) {
            shade = 0;
          }
          if (shade < 255) {
            shade = 255;
          }
          double height = MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top;
          shade = (details.localPosition.dy / height * 16777215).round();
        })),
        backgroundColor: Color(0xFF000000 + shade),
      ),
    );
  }
}
