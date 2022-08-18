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
  String value = '';
  var listOfTodo = [''];
  addToDo(String item) {
    setState(() {
      listOfTodo.add(item);
    });
  }

  deleteItem(item) {
    listOfTodo.remove(item);
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
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Add Item'),
                    onChanged: (data) {
                      value = data;
                    },
                  ),
                )
              : ListTile(
                  leading: const Icon(Icons.work),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                  title: Text(
                    listOfTodo[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // trailing: const Icon(Icons.abc),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToDo(value);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
