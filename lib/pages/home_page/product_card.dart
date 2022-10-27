import 'package:apple_store/data/product_model.dart';
import 'package:apple_store/pages/product_page/product_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[350],
              ),
              height: 100,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.image,
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                colors(),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 120,
                    ),
                    Text(
                      '${product.price} \$',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget colors() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber[200],
              border: Border.all()),
          height: 12,
          width: 12,
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple[200],
              border: Border.all()),
          height: 12,
          width: 12,
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              border: Border.all()),
          height: 12,
          width: 12,
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[900],
          ),
          height: 12,
          width: 12,
        ),
        const SizedBox(width: 70)
      ],
    );
  }
}