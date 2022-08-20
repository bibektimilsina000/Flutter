import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // to add icon images

  var cross = const Icon(Icons.cancel);
  var circle = const Icon(Icons.circle);
  var edit = const Icon(Icons.edit);

  // ititilise box with empty value

  bool isCross = true;
  String message = '';

  List<String> gameState = [];

  @override
  void initState() {
    gameState = List.filled(9, 'empty');
    message = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('TicTacToe'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('textwidget'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.deepPurpleAccent,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Setting',
            icon: Icon(
              Icons.settings,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
