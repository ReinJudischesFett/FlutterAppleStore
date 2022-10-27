import 'package:apple_store/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: state is CartLoaded
                ? Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.cart.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[350],
                                    ),
                                    height: 100,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        state.cart[index].product.image,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.cart[index].product.name),
                                      Text(state.cart[index].selectedStorage),
                                      ElevatedButton(
                                        onPressed: () =>
                                            BlocProvider.of<CartCubit>(context)
                                                .removeItemFromCart(
                                          state.cart[index],
                                        ),
                                        child: const Text('remove'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                      const SizedBox(height: 150),
                      Text('total price: ${state.getTotalPrice()} \$'),
                      const SizedBox(height: 20),
                      Row(children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('buy'),
                          ),
                        ),
                      ]),
                    ],
                  )
                : const Center(
                    child: Text(
                      'Your cart is empty :(',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
