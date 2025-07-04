import 'product_model.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

abstract class ProductServices {
  Future<List<Product>> fetchAllProducts();
}

class ProductServicesImpl implements ProductServices {
  @override
  Future<List<Product>> fetchAllProducts() async {
    const String url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('successful: ${response.statusCode}');
        final body = response.body;
        final List<dynamic> jsonList = jsonDecode(body);
        final products = jsonList.map((e) => Product.fromJson(e)).toList().cast<Product>();
        return products;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      print('SocketException: $e');
      throw Exception('No Internet connection: $e');
    } catch (e) {
      print(e);
      throw Exception('failed to load products $e');
    }
  }
} 
