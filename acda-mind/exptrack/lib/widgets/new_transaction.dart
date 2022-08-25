import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  late final Function addTranx;

  NewTransaction(this.addTranx);

  final titleControl = TextEditingController();
  final amountControl = TextEditingController();

  void submmitData() {
    final entredTitle = titleControl.text;
    final entredAmount = double.parse(amountControl.text);

    if (entredTitle.isEmpty || entredAmount <= 0) {
      print('invalid input');
    } else {
      addTranx(entredTitle, entredAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleControl,
                onSubmitted: (value) => submmitData(),
                cursorColor: Colors.purple),
            TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountControl,
                onSubmitted: (value) => submmitData(),
                cursorColor: Colors.purple),
            TextButton(
                onPressed: () {
                  submmitData();
                },
                child: const Text(
                  'Add Transection',
                  style: TextStyle(color: Colors.purple),
                )),
          ],
        ),
      ),
    );
  }
}