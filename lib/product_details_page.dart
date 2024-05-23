import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> products;
  const ProductDetailsPage({super.key, required this.products});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.products['id'],
          'title': widget.products['title'],
          'Price': widget.products['Price'],
          'imageUrl': widget.products['imageUrl'],
          'company': widget.products['company'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added Successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select size!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.products['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                widget.products['imageUrl'] as String,
                height: 250,
                width: 250,
                alignment: Alignment.center,
              ),
            ),
            const Spacer(flex: 2),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  Text('\$${widget.products['price']}',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.products['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.products['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(size.toString()),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(300, 55),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
