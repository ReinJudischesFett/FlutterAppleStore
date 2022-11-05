// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apple_store/cubit/cart/cart_cubit.dart';
import 'package:apple_store/cubit/product/product_cubit.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:apple_store/pages/cart_page/cart_page.dart';
import 'package:apple_store/pages/product_page/color_picker.dart';
import 'package:apple_store/pages/product_page/storage_picker.dart';
import 'package:apple_store/widgets/cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animated_image.dart';

class ProductPage extends StatelessWidget {
  final scrollController = ScrollController();
  final Product product;

  ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).setController(scrollController);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[350],
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<ProductCubit>(context).finish();
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.grey[350],
            title: Text(
              product.name,
            ),
            actions: const [
              CartBadge(),
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedImage(),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  height: 340,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ColorPicker(),
                      SizedBox(
                        height: 30,
                      ),
                      StoragePicker(),
                      SizedBox(height: 40),
                      state is ProductStage2
                          ? GestureDetector(
                              onTap: () => BlocProvider.of<CartCubit>(context)
                                  .addItemToCart(
                                product,
                                state.selectedColor,
                                state.selectedStorage,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Text('Add to bag'),
                              ),
                            )
                          : Text('')
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
