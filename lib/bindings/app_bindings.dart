
import 'package:get/get.dart';
import 'package:simple_product_list_app/Controller/product_controller.dart';
import 'package:simple_product_list_app/product_repository.dart';

import '../Controller/home_controller.dart';



class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(ProductController(Get.find()));

  }
}