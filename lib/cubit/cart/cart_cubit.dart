import 'package:apple_store/config/storage_size.dart';
import 'package:apple_store/data/cart_product_model.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<CartProduct> cartProducts = [];

  CartCubit() : super(CartInitial());

  void addItemToCart(
      Product product, Color selectedColor, String selectedStorage) {
    final finalPrice = product.price + getAddedPrice(selectedStorage);
    cartProducts.add(
      CartProduct(
        product,
        selectedColor,
        selectedStorage,
        finalPrice,
      ),
    );
    emit(CartLoaded(cartProducts));
  }

  int getAddedPrice(String selectedStorage) {
    switch (selectedStorage) {
      case storage256:
        return 100;
      case storage512:
        return 200;
      case storage1024:
        return 300;
      default:
        return 0;
    }
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
