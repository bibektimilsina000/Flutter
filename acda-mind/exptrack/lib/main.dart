import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          Column(
            children: transactions.map((txt) {
              return Card(
                child: Row(
                  children: [
                    Container(

                      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      decoration: BoxDecoration(border: Border.all(width: 2,color:Colors.purple)),
                      padding: const EdgeInsets.all(10),



                      child: Text(
                        
                         'Rs: ${txt.amount}',
                        style: const TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                      Text(txt.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16), ),
                      Text(txt.date.toString(),style: const TextStyle(color: Colors.grey),)
                    ],)
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}