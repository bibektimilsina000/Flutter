import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart' as or;

class OrderItem extends StatefulWidget {
  final or.OrderItem order;

  const OrderItem(this.order, {super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Rs: ${widget.order.amount}'),
            subtitle: Text(
                DateFormat('yyyy-mm-dd hh:mm a').format(widget.order.dateTime)),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      icon: expanded
                          ? const Icon(Icons.expand_less)
                          : const Icon(Icons.expand_more)),
                  Consumer<or.Orders>(
                    builder: (context, value, child) => IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
            ),
          ),
          if (expanded)
            SizedBox(
              height: widget.order.products.length * 20 + 70,
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                              child: Text(widget.order.products[index].title)),
                          const Spacer(),
                          Text(' Rs :${widget.order.products[index].price}'),
                          const SizedBox(width: 20),
                          Text('${widget.order.products[index].quantity} X'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
