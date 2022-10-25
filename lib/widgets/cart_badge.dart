import 'package:apple_store/cubit/cart/cart_cubit.dart';
import 'package:apple_store/pages/cart_page.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        return Badge(
          showBadge: state is CartLoaded?,
          badgeContent:
              state is CartLoaded ? Text('${state.cart.length}') : null,
          position: BadgePosition.topEnd(top: 1, end: 1),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }
}
