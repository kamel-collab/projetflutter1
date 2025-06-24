import 'package:flutter/material.dart';
import 'package:projet/home_screen.dart';
import 'package:projet/setting_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/settings': (context) => SettingScreen(),
      },
    );
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
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final dest = destinations[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                print("Destination sélectionnée : ${dest['city']}");
              },
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        dest['image']!,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dest['city']!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            dest['desc']!,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
