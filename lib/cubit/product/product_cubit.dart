import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  late ScrollController scrollController;

  void setController(ScrollController scrollController) {
    this.scrollController = scrollController;
  }

  void colorChosen(Color color) {
    emit(ProductStage1(color));
    scrollController.animateTo(
      500,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void storageChosen(String storage) {
    final currentState = state;

    if (currentState is ProductStage1) {
      emit(ProductStage2(currentState.selectedColor, storage));
    }
    scrollController.animateTo(
      700,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void finish() {
    emit(ProductInitial());
  }
}
