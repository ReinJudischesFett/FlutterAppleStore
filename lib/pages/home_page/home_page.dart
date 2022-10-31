// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apple_store/pages/home_page/categories.dart';
import 'package:apple_store/pages/home_page/products_list.dart';
import 'package:apple_store/pages/home_page/search_bar.dart';
import 'package:apple_store/widgets/cart_badge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_pin, color: Colors.black),
            SizedBox(width: 5),
            Text(
              'choose your country',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.grey[350],
        elevation: 0,
        actions: const [
          CartBadge(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Categories(),
            const SizedBox(
              height: 30,
            ),
            SearchBar(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(width: 20),
                Text('All items', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const ProductsList(),
          ],
        ),
      ),
    );
  }
}
