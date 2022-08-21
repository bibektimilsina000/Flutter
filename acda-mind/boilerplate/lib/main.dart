import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
    var questions = [
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
      {
        'questionText': 'Restart your game',
        'answer': ['']
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quitz App'),
          ),
          body: Column(
            children: [
              Question(questions[questionIndex]['questionText'].toString()),
              ...(questions[questionIndex]['answer'] as List<String>)
                  .map((answer) {
                return Answer(answerQuestion, answer);
              }).toList()
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: restart,
              child: const Icon(
                Icons.restart_alt_outlined,
              ))),
    );
  }
}
