// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apple_store/cubit/categories/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 15),
                Text('Select category', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Chip(
                    backgroundColor: Colors.white,
                    label: Column(
                      children: [
                        Icon(Icons.laptop_mac),
                        Text('mac'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Chip(
                    backgroundColor: Colors.white,
                    label: Column(
                      children: [
                        Icon(Icons.phone_iphone),
                        Text('iphone'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Chip(
                    backgroundColor: Colors.white,
                    label: Column(
                      children: [
                        Icon(Icons.tablet_mac),
                        Text('ipad'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Chip(
                    backgroundColor: Colors.white,
                    label: Column(
                      children: [
                        Icon(Icons.watch),
                        Text('watch'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),

              ],
            ),
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
        label: Column(
          children: [
            Icon(Icons.laptop),
            Text('mac'),
          ],
        ),
      ),
    );
  }
}
