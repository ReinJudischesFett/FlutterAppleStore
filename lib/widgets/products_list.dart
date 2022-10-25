import 'package:apple_store/cubit/categories/categories_cubit.dart';
import 'package:apple_store/data/db.dart';
import 'package:apple_store/data/product_model.dart';
import 'package:apple_store/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final db = DataBase();
    List<Product>? productList;

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: ((context, state) {
        if (state is CategoriesInitial) {
          productList = db.productList;
        } else if (state is CategoriesSelected) {
          productList = db.productList
              .where((element) => element.category == state.category)
              .toList();
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: ListView.builder(
              itemCount: productList!.length,
              itemBuilder: (_, index) =>
                  ProductCard(product: productList![index]),
            ),
          ),
        );
      }),
    );
  }
}
