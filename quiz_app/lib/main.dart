import 'package:flutter/material.dart';

import 'question.dart';
import 'package:quiz_app/answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      "question": "What\'s your favourite color ?",
      "answer": ["Black", "Red", "Green", "White"]
    },
    {
      "question": "What\'s your favourite animal ?",
      "answer": ["Lion", "Tiger", "Elephant", "Dog"]
    },
    {
      "question": "Who\'s your favourite istructor ?",
      "answer": ["Max", "Max", "Max", "Max"]
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex >= questions.length - 1) {
      setState(() {
        _questionIndex = 0;
      });
    } else {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['question'] as String,
            ),
            ...(questions[_questionIndex]['answer'] as List<String>)
                .map((answerText) {
              return Answer(_answerQuestion, answerText);
            }).toList()
          ],
        ),
      ),
    );
  }
}
