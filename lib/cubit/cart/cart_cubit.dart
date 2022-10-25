import 'dart:developer';

import 'package:apple_store/data/cart_model.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final cart = Cart();

  CartCubit() : super(CartInitial());

  void addItemToCart(Product product) {
    cart.add(product);
    emit(CartLoaded(cart.productCart));
  }


  void removeItemFromCart(Product product) {
    cart.remove(product);
    if (cart.productCart.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartLoaded(cart.productCart));
    }
  }
}
