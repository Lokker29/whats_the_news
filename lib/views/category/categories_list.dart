import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';

import 'category_tile.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: categories
                .map((element) => CategoryTile(
                      category: element,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
