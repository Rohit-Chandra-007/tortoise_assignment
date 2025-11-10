import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tortoise_assignment/models/product.dart';

class Products {
  Future<List<Product>> fetchProducts() async {
    var url = Uri.parse('https://procodev.tortoise.pro/v2/product');
    var response = await http.get(
      url,
      headers: {'authorization': '2urdoDDiQ6xtRCYAaRuse0qhIbDA3VKF'},
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      List<Product> products = [];

      for (var item in jsonData['results']) {
        products.add(Product.fromJson(item));
      }

      return products;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  }
}
