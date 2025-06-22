import 'package:get/get.dart';
import 'package:simple_product_list_app/product_model.dart';
import 'package:simple_product_list_app/product_repository.dart';

class ProductController extends GetxController {

  final ProductRepository _productRepository;

  ProductController(this._productRepository);

  Future<List<Product>> getAllProducts() async {
    try {
      final products = await _productRepository.getAllProducts();
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to fetch products');
    }
  }
  
}