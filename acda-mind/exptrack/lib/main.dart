import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:   Text('Expense Tracker'),
        ),
        body: Column(
          children:   [
                Container(
                  color: Color(Colors.blue),
                  width: double.infinity,
                  child: Text('chart'),
                ),
               
             
                Card(
              child:   Text('list of Tranx'),
            ),
          ],
        ));
  }
}
