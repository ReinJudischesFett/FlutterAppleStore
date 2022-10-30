import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  const ProductImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[350],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}
