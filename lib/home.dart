import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_product_list_app/Controller/product_controller.dart';
import 'package:simple_product_list_app/product_card.dart';
import 'package:simple_product_list_app/product_model.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.find<ProductController>();
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = controller.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.menu)),
                    
            Text('Online Shop',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            Icon(Icons.search),
            Stack(
                  children: [
                    IconButton(onPressed: (){}, 
                    icon: Icon(Icons.message, color: Colors.blue)),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ))
                  ],
                ),
            Stack(
                  children: [
                    IconButton(onPressed: (){}, 
                    icon: Icon(Icons.notifications, color: Colors.blue)),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ))
                  ],
                ),
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 16.0),
          child: Text('Recommendation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
        SizedBox(height: 12,),

        FutureBuilder(
          future: _productsFuture, 
          builder: (context,snapshot){
            if (snapshot.hasData) {
              final products = snapshot.data!;
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                    child: ProductCard(product: products[index]));
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else{
              return Center(child: Text('No products found'));
            }
        })
        ],
      ),
    );
  }
}