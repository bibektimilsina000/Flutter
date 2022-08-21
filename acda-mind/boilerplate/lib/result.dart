import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalscore;
  final VoidCallback restart;

  const Result({required this.totalscore, required this.restart});

  String get resultPhrase {
    if (totalscore < 10) {
      return 'you are very  good and innocient  ';
    } else if (totalscore < 20) {
      return ' you are pretty good';
    } else if (totalscore < 35) {
      return 'you are acceptable';
    } else {
      return 'you are bad  ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(onPressed: restart, child: const Text('Restart Quiz'))
      ],
    );
  }
}
