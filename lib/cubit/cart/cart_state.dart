part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}


class CartLoaded extends CartState {
  final List<Product> cart;
  int getTotalPrice() {
    int result = 0;
    for (var product in cart) {
      result += product.price;
    }
    return result;
  }

  CartLoaded(this.cart);
}
