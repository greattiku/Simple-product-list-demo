import 'package:simple_product_list_app/product_services.dart';

import 'product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  // Future<Product> fetchProductById(int id);
  // Future<List<Product>> fetchProductsByCategory(String category);
  // Future<List<Product>> searchProducts(String query);
  // Future<void> addProduct(Product product);
  // Future<void> updateProduct(Product product);
  // Future<void> deleteProduct(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductServices _productServices;

  ProductRepositoryImpl(this._productServices);

  @override
  Future<List<Product>> getAllProducts() async{
    try {
      final products = await _productServices.fetchAllProducts();
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to fetch products');
    }
  }
}