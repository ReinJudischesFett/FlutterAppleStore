import 'package:apple_store/pages/home_page/categories.dart';
import 'package:apple_store/pages/home_page/products_list.dart';
import 'package:apple_store/widgets/cart_badge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'search',
              border: InputBorder.none,
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[350],
        elevation: 0,
        actions: const [
          CartBadge(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Categories(),
            ProductsList(),
          ],
        ),
      ),
    );
  }
}
