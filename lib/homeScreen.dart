import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_product_list_app/Constants/colors.dart';

import 'Constants/custom_textstyles.dart';
import 'Controller/home_controller.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    var controller = Get.find<HomeController>();

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: Home()),
      
        bottomNavigationBar: Obx(()=>
           BottomNavigationBar(
            selectedLabelStyle: titleSmall.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                unselectedLabelStyle: titleSmall.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
            selectedItemColor: AppColors.appPrimaryColor,
                  iconSize: 20,
                currentIndex: controller.currentPageIndex.value,
                onTap: (index) {
                  controller.changePageIndex(index);
      
                    },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
              type: BottomNavigationBarType.fixed,
            ),
        ),
        ),
    );
                 

  }
}