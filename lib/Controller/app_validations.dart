import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_product_list_app/product_model.dart';

  Future<List<Product>> fetchAllProducts() async {
    const String url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('successful: ${response.statusCode}');
        final body = response.body;
        final List<dynamic> jsonList = jsonDecode(body);
        print('product image: ${jsonList[0]['image']}');
        final products = jsonList.map((e) => Product.fromJson(e)).toList().cast<Product>();
        return products;
      } else {
        throw Exception('failed to load products');
      }
    } catch (e) {
      print(e);
       throw Exception('failed to load products $e');
    }
  }
  //why are the images not showing, neither is it showing that the image has an error. the title price are showing too. the correct image is printing to the console too

