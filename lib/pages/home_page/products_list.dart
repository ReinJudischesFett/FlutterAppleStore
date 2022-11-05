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
    List<Product> productList = db.productList;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (_, index) => ProductCard(productList[index]),
    );
  }
}
