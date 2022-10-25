import 'package:apple_store/cubit/cart/cart_cubit.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:apple_store/widgets/cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        actions: const [
          CartBadge(),
        ],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            height: 350,
            child: Image.network(
              product.image,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            height: 150,
            width: 300,
            child: Column(
              children: [
                Text(product.name),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton( 
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addItemToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to cart'),
                  action: SnackBarAction(
                    label: 'remove',
                    onPressed: () => BlocProvider.of<CartCubit>(context)
                        .removeItemFromCart(product),
                  ),
                ),
              );
            },
            child: const Text('add to cart'),
          ),
        ],
      ),
    );
  }
}
