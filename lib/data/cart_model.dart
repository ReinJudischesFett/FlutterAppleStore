import 'package:apple_store/data/product_model.dart';

class Cart {
  List<Product> productCart = [];

  void add(Product product) {
    productCart.add(product);
  }

  void remove(Product product) {
    productCart.remove(product);
  }

}
