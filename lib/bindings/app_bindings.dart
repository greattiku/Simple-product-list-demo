
import 'package:get/get.dart';
import 'package:simple_product_list_app/Controller/product_controller.dart';
import 'package:simple_product_list_app/product_repository.dart';
import 'package:simple_product_list_app/product_services.dart';

import '../Controller/home_controller.dart';



class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductServices>(() => ProductServicesImpl()); // Bind ProductServices to its implementation
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(Get.find())); 
    Get.put(HomeController(), permanent: true);
    Get.put(ProductController(Get.find())); 

  }
}