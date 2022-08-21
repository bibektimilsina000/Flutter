import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  restart() {
    setState(() {
      questionIndex = 0;
    });
  }

  answerQuestion() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': ['Black', 'red', 'blue']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': ['Snake', 'Tiger', 'wolf', 'cat']
      },
      {
        'questionText': 'What\'s your favorite superhero?',
        'answer': ['Ironman ', 'Thor ', 'Captain America']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quitz App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(answerQuestion, questions, questionIndex)
            : Result(),
        floatingActionButton: FloatingActionButton(
          onPressed: restart,
          child: const Icon(
            Icons.restart_alt_outlined,
          ),
        ),
      ),
    );
  }
}
