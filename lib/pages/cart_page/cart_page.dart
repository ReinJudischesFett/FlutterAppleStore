// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:apple_store/pages/cart_page/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_store/cubit/cart/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[350],
            elevation: 0,
          ),
          body: state is CartLoaded
              ? ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.cart.length,
                  itemBuilder: (context, index) {
                    return CartItem(state.cart[index]);
                  },
                )
              : Center(
                  child: Text('no items'),
                ),
          bottomNavigationBar: Container(
            height: 90,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:'),
                    state is CartLoaded
                        ? Text('\$ ${state.getTotalPrice()}')
                        : Text(''),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          'checkout',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
