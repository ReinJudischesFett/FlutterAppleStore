part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesSelected extends CategoriesState {
  final String category;

  CategoriesSelected(this.category);
}
