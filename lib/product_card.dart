import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_product_list_app/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key,
  this.product,
  });
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4), 
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                product?.image ?? '',
                fit: BoxFit.cover,
                
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Text(product?.title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          //fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 4,),
        Row(
          children: [
            Text('\$${product?.price ?? 0.00}'),
            const SizedBox(width: 8,),
            ElevatedButton(onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Buy now',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            )),
        )],
        ),
      ],
    );
  }
}