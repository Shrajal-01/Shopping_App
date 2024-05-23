import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroungColor;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backgroungColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroungColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 175,
              width: 175,
            ),
          )
        ]),
      ),
    );
  }
}
