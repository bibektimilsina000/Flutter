import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data')),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            height: 100,
            color: Colors.red,
            child: const Text('item 1'),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: 100,
            color: Colors.yellow,
            child: const Text('item 1 - the red container'),
          ),
        ),
        Container(
          height: 100,
          color: Colors.blue,
          child: const Text('item 1'),
        ),
      ],
    );
  }
}
