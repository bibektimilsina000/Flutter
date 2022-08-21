import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  int totalScore = 0;
  restart() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': [
          {'Text': 'Black', 'score': 10},
          {'Text': 'red', 'score': 5},
          {'Text': 'blue', 'score': 3},
          {'Text': 'white', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': [
          {'Text': 'tiger', 'score': 3},
          {'Text': 'wolf', 'score': 5},
          {'Text': 'snake', 'score': 10},
          {'Text': 'rabbit', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favorite superhero?',
        'answer': [
          {'Text': 'Ironman', 'score': 3},
          {'Text': 'Thor', 'score': 2},
          {'Text': 'Captain America', 'score': 1},
          {'Text': 'Thanos', 'score': 10},
          {'Text': 'Loki', 'score': 8}
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questions: questions,
                questionIndex: questionIndex)
            : Result(totalscore: totalScore, restart: restart),
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
