import 'package:flutter/material.dart';
import 'package:projet/components/product_card.dart';
import 'package:projet/data/get_product_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List productsList = [];
    fetchProductsFromApi()
        .then((products) {
          productsList = products;
          print(products);
        })
        .catchError((error) {
          print('Erreur lors de la récupération des produits : $error');
        });
    return Scaffold(
      appBar: AppBar(title: const Text('Ecommerce')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double cardWith = 180;
          int crossAxisCount = (constraints.maxWidth / cardWith).floor();
          if (crossAxisCount < 2) {
            crossAxisCount = 2; // Minimum 2 cards per row
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return ProductCard(
                name: productsList[index]['name'],
                price: productsList[index]['price'],
                imageUrl: productsList[index]['imageUrl'],
              );
            },
          );
        },
      ),

      bottomNavigationBar: buttomNav(),
    );
  }

  BottomNavigationBar buttomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
