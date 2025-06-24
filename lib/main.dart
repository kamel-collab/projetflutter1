import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('inside myapp');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('home')),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return UserCard(i: index);
          },
        ),
      ),
    );
  }
}

class UserCard extends StatefulWidget {
  UserCard({super.key, required this.i});
  final int i;
  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    print(widget.i);
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
  }
}
