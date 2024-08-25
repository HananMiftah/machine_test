import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductWidget extends StatelessWidget {
  final List<ProductModel> products;

  ProductWidget({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index].contents.isNotEmpty
            ? products[index].contents[0]
            : null; // Assuming you want to show the first content item

        if (product == null) {
          return Center(child: Text('No product data available'));
        }

        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.productImage,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.productName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${product.offerPrice}'),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        // Handle add to cart action
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
