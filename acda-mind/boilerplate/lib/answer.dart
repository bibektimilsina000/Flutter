import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;

  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      color: Colors.blue,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: selectHandler,
        child: Text('answers'),
      ),
    );
  }
}
