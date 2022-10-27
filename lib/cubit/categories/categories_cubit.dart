import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void selectCategory(String category) {
    emit(CategoriesSelected(category));
  }

  void removeCategory() {
    emit(CategoriesInitial());
  }
}
