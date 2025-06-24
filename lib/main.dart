import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DestinationList());
  }
}

class DestinationList extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      "city": "Paris",
      "desc": "La ville lumière",
      "image":
          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=400&q=60",
    },
    {
      "city": "Tokyo",
      "desc": "La ville futuriste",
      "image":
          "https://images.unsplash.com/photo-1549693578-d683be217e58?auto=format&fit=crop&w=400&q=60",
    },
    {
      "city": "Alger",
      "desc": "La blanche perle",
      "image":
          "https://images.unsplash.com/photo-1549693578-d683be217e58?auto=format&fit=crop&w=400&q=60",
    },
    {
      "city": "Alger",
      "desc": "La blanche perle",
      "image":
          "https://images.unsplash.com/photo-1549693578-d683be217e58?auto=format&fit=crop&w=400&q=60",
    },
    {
      "city": "Alger",
      "desc": "La blanche perle",
      "image":
          "https://images.unsplash.com/photo-1549693578-d683be217e58?auto=format&fit=crop&w=400&q=60",
    },
    {
      "city": "Alger",
      "desc": "La blanche perle",
      "image":
          "https://images.unsplash.com/photo-1549693578-d683be217e58?auto=format&fit=crop&w=400&q=60",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinations'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(),
    );
  }
}
