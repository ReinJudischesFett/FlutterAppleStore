// ignore_for_file: prefer_const_constructors

import 'package:apple_store/cubit/categories/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            categoryChip(context, state, 'mac'),
            SizedBox(
              width: 10,
            ),
            categoryChip(context, state, 'iphone'),
            SizedBox(
              width: 10,
            ),
            categoryChip(context, state, 'ipad'),
            SizedBox(
              width: 10,
            ),
            categoryChip(context, state, 'apple watch'),
          ],
        );
      },
    );
  }

  Widget categoryChip(
      BuildContext context, CategoriesState state, String categoryName) {
    var chipColor = Colors.white;
    if (state is CategoriesSelected) {
      if (state.category == categoryName) {
        chipColor = Colors.blueGrey[200]!;
      }
    }
    return GestureDetector(
      onTap: () {
        if (chipColor == Colors.blueGrey[200]) {
          BlocProvider.of<CategoriesCubit>(context).removeCategory();
        } else {
          BlocProvider.of<CategoriesCubit>(context)
              .selectCategory(categoryName);
        }
      },
      child: Chip(
        backgroundColor: chipColor,
        label: Text(categoryName),
      ),
    );
  }
}
