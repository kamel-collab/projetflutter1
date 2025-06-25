import 'package:flutter/material.dart';
import 'package:projet/components/product_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductCard(
                name: 'Produit $index',
                price: '${index * 10 + 99}',
                imageUrl:
                    'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg',
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
