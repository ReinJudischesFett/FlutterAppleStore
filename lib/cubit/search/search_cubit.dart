import 'dart:developer';

import 'package:apple_store/data/db.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final db = DataBase();
  SearchCubit() : super(SearchInitial());

  void makeQuery(String query) {
    final List<Product> productsByQuery = db.productList
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(SearchResult(productsByQuery, query));
  }
}
