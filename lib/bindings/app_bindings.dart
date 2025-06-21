
import 'package:get/get.dart';

import '../Controller/home_controller.dart';



class MyBindings implements Bindings{
  @override
  void dependencies() {
   Get.put(HomeController(),permanent: true);
  }
  
}