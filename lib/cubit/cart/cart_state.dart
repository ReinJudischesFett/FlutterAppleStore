part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartProduct> cart;
  int getTotalPrice() {
    int result = 0;
    for (var cartProduct in cart) {
      result += cartProduct.finalPrice;
    }
    return result;
  }

  CartLoaded(this.cart);
}
