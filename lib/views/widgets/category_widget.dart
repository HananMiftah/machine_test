import 'package:flutter/material.dart';
import '../../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  CategoryWidget({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Text(categories[index].title),
              ],
            ),
          );
        },
      ),
    );
  }
}
