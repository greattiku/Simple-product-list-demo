import 'package:get/get.dart';

class HomeController extends GetxController{
 final  currentPageIndex = 0.obs;

  void changePageIndex(int index) {
    currentPageIndex.value = index;
  }

}