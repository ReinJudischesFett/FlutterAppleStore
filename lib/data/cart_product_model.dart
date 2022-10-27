import 'package:apple_store/data/product_model.dart';


class CartProduct {
  final Product product;
  final String selectedColor;
  final String selectedStorage;
  late int finalPrice;
  CartProduct(this.product, this.selectedColor, this.selectedStorage);
}
