import 'package:flutter/material.dart';

Future<Null> errorDialog(BuildContext context) {
  return showDialog<Null>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('An error occurs!'),
      content: Text("Opps! Something went wrong."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('close'))
      ],
    ),
  );
}
