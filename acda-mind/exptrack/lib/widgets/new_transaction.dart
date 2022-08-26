import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  late final Function addTranx;

  NewTransaction(this.addTranx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControl = TextEditingController();

  final amountControl = TextEditingController();

  DateTime choosenDate = DateTime(0);

  String checkdate = DateTime(0).toString();

  void submmitData() {
    final entredTitle = titleControl.text;
    final entredAmount = double.parse(amountControl.text);

    if (entredTitle.isEmpty || entredAmount <= 0) {
    } else {
      widget.addTranx(entredTitle, entredAmount);
    }

    Navigator.of(context).pop();
  }

  void presetDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value.toString() == checkdate) {
        return;
      }

      setState(() {
        choosenDate = value as DateTime;
      });
    });
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      choosenDate.toString() == checkdate
                          ? 'No date Choosen'
                          : 'Picked date: ${DateFormat.yMd().format(choosenDate)}',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  TextButton(
                      onPressed: presetDatePicker,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  submmitData();
                },
                child: const Text(
                  'Add Transection',
                )),
          ],
        ),
      ),
    );
  }
}
