import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Dice App',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int state = 1;
  roll() {
    debugPrint('dice rolled');
    setState(() {
      state = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dice Roller"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'images/dice$state.webp',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              onPressed: roll,
              child: const Text(
                'Roll',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
