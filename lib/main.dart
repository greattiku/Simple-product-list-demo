import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_product_list_app/homeScreen.dart';

import 'bindings/app_bindings.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  MyBindings().dependencies();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomeScreen(),
    );
  }
}