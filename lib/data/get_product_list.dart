import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchProductsFromApi() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.in/api/products'),
  );

  if (response.statusCode == 200) {
    final decoded = json.decode(response.body);

    // On prend la liste sous la clé "products"
    final List data = decoded['products'];
    return data.map<Map<String, dynamic>>((product) {
      return {
        "name": product['title'],
        "price": "${product['price']} \$",
        "imageUrl": product['image'],
        // Si jamais le champ "rating" n'existe pas sur certains produits, tu peux le mettre à null ou autre valeur par défaut
        "rating": product.containsKey('rating')
            ? (product['rating']['rate'] as num).round()
            : 3,
      };
    }).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
