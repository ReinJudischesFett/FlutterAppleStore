import 'package:apple_store/data/cart_product_model.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<CartProduct> cartProducts = [];

  CartCubit() : super(CartInitial());

  void addItemToCart(
      Product product, String selectedColor, String selectedStorage) {
    cartProducts.add(CartProduct(product, selectedColor, selectedStorage));
    emit(CartLoaded(cartProducts));
  }

  void removeItemFromCart(CartProduct cartProduct) {
    cartProducts.remove(cartProduct);
    if (cartProducts.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartLoaded(cartProducts));
    }
  }
}
