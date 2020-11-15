import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';

import 'category_tile.dart';

class CategoriesList extends StatelessWidget {
  final Function setActiveCategoryCallback;
  final String activeCategoryName;
  final List<Category> categories = Category.getCategories();

  CategoriesList({this.activeCategoryName, this.setActiveCategoryCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // itemCount: categories.length,
        child: Row(
          children: categories
              .map((element) => CategoryTile(
            category: element,
            activeCategoryName: activeCategoryName,
            setActiveCategoryCallback: setActiveCategoryCallback,
          ))
              .toList(),
        ),
      ),
    );
  }
}
