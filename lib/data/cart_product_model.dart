import 'package:apple_store/data/product_model.dart';
import 'package:flutter/material.dart';

class CartProduct {
  final Product product;
  final Color selectedColor;
  final String selectedStorage;
  final int finalPrice;
  CartProduct(
      this.product, this.selectedColor, this.selectedStorage, this.finalPrice);
}
