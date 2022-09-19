import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function tranxdel;

  const TransactionsList(this.transaction, this.tranxdel);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: transaction.isEmpty
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Text(
                      'No transaction added yet !',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.contain),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Text(
                              'Rs: ${(transaction[index].amount).toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: mediaQuery.size.width > 450
                        // ? FlatButton.icon(
                        //     onPressed: () => tranxdel(transaction[index].id),
                        //     icon: const Icon(Icons.delete),
                        //     textColor: Theme.of(context).errorColor,
                        //     label: const Text('Delete'),
                        //   )
                        : IconButton(
                            onPressed: () => tranxdel(transaction[index].id),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
            ),
    );
  }
}
