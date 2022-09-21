import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answer;

  const Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answer),
      ),
    );
  }
}
