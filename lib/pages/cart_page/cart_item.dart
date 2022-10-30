import 'package:apple_store/cubit/cart/cart_cubit.dart';
import 'package:apple_store/data/cart_product_model.dart';
import 'package:apple_store/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final CartProduct cartProduct;
  const CartItem(this.cartProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProductImage(
            cartProduct.product.image,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cartProduct.product.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${cartProduct.finalPrice}',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cartProduct.selectedColor,
                      border: Border.all(color: Colors.black),
                    ),
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 35,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(cartProduct.selectedStorage),
                  ),
                ],
              ),
              SizedBox(
                width: 180, // how to use expanded?
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                        .removeItemFromCart(cartProduct);
                  },
                  child: Text('remove'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
