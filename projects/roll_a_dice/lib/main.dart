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
  int numb = 0;

  int roll() {
    return numb;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dice Roller"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            "images/dice1.webp",
            height: 20,
          ),
          MaterialButton(onPressed: roll)
        ],
      ),
    );
  }
}
