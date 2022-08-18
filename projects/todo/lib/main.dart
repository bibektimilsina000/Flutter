import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TO DO",
      home: TODO(),
    ));

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  var listOfTodo = ['hello'];
  addToDo(String item) {
    setState(() {
      listOfTodo.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo'),
      ),
      body: ListView.builder(
        itemCount: listOfTodo.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.work),
            title: Text(
              listOfTodo[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // trailing: const Icon(Icons.abc),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }
}
