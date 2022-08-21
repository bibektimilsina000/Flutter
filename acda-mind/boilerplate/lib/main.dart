import 'package:flutter/material.dart';

import 'question.dart';

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
  var _questionIndex = 0;
  void answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Not my first app'),
          ),
          body: Column(
            children: [
              Question(questions[_questionIndex]),
              RaisedButton(onPressed: answerQuestion, child: Text('answewr1')),
              RaisedButton(onPressed: answerQuestion, child: Text('answewr2')),
              RaisedButton(onPressed: answerQuestion, child: Text('answewr3 ')),
            ],
          )),
    );
  }
}
