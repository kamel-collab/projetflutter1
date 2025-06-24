import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('home')),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    b = !b;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: b ? Colors.yellow : Colors.grey),
                      SizedBox(width: 20),
                      Text("element d'une list"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
