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
    final currentState = state;
     if (currentState is ProductStage2) {
      emit(ProductStage2(color, currentState.selectedStorage));
    } else {
      emit(ProductStage1(color));
    }
  }

  void storageChosen(String storage) {
    final currentState = state;
    Color? selectedColor;

    if (currentState is ProductStage1) {
      // ?? why cant use 'state'
      selectedColor = currentState.selectedColor;
    }
    if (currentState is ProductStage2) {
      // wtf, selectedColor cant be final, cause it can be assigned twice, is there opportunity to have 2 states at once?
      selectedColor = currentState.selectedColor;
    }
    emit(ProductStage2(selectedColor!, storage));

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 50),
      curve: Curves.ease,
    );
  }

  void finish() {
    emit(ProductInitial());
  }
}
