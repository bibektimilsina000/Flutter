import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart' as or;

class OrderItem extends StatefulWidget {
  final or.OrderItem order;
  final String id;

  const OrderItem(this.id, this.order, {super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<or.Orders>(context, listen: false);
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        orderData.deleteOrder(widget.id);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are You Sure?'),
            content: Text('You are about delete your order.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              )
            ],
          ),
        );
      },
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height:
            expanded ? min(widget.order.products.length * 60 + 150, 250) : 100,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text('Rs: ${widget.order.amount}'),
                subtitle: Text(DateFormat('yyyy-mm-dd hh:mm a')
                    .format(widget.order.dateTime)),
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
                                  child:
                                      Text(widget.order.products[index].title)),
                              const Spacer(),
                              Text(
                                  ' Rs :${widget.order.products[index].price}'),
                              const SizedBox(width: 20),
                              Text(
                                  '${widget.order.products[index].quantity} X'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
