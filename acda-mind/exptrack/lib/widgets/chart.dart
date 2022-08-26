import 'package:exptrack/widgets/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransectionValue {
    return List.generate(7, (index) {
      final weeekday = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weeekday.day &&
            recentTransaction[i].date.month == weeekday.month &&
            recentTransaction[i].date.year == weeekday.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weeekday), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totolspending {
    return groupedTransectionValue.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...groupedTransectionValue.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'].toString(),
                    data['amount'] as double,
                    totolspending == 0
                        ? 0.0
                        : (data['amount'] as double) / totolspending),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
