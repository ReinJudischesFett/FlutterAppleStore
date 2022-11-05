// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TestSlivers extends StatelessWidget {
  final imgUrl =
      'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_zoom/ION46_Z_P_7290106708600_1.png';
  const TestSlivers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
            title: AspectRatio(
              aspectRatio: 1,
              child: Image.network(imgUrl),
            ),
            centerTitle: true,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 500, child: Text('222'),),)
      ],
    );
  }
}
