import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Porfile App',
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Porfile App'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Name : Bibek Timilsina',
            style: TextStyle(
                backgroundColor: Colors.blue,
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Adderss : Banepa , Nepal',
            style: TextStyle(
                backgroundColor: Colors.blue,
                fontSize: 20,
                fontFamily: 'sans-serf',
                color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text('Email:bibektimilsina000@gmail.com'),
          const SizedBox(
            height: 140,
          ),
          const Text('Developed by : Bibek Timilsina')
        ],
      ),
    ),
  ));
}
