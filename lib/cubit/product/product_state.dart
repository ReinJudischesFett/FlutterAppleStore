part of 'product_cubit.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductStage1 extends ProductState {
  final Color selectedColor;
  ProductStage1(this.selectedColor);

  @override
  List<Object?> get props => [selectedColor];
}

class ProductStage2 extends ProductState {
  final Color selectedColor;
  final String selectedStorage;
  ProductStage2(this.selectedColor, this.selectedStorage);

  @override
  List<Object?> get props => [selectedColor, selectedStorage];
}
