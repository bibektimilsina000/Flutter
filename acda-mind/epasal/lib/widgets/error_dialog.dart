import 'package:flutter/material.dart';

Future<Null> errorDialog(BuildContext context, String errorMessage) {
  return showDialog<Null>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('An error occurs!'),
      content: Text(errorMessage),
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
