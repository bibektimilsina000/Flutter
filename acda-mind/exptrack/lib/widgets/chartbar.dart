import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendingPerOfTotal;

  const ChartBar(this.label, this.spendAmount, this.spendingPerOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('Rs.${spendAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(220, 220, 220, 1)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPerOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(label)))
          ],
        );
      },
    );
  }
}
