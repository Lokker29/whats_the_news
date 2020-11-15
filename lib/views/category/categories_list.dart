import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';

import 'category_tile.dart';

class CategoriesList extends StatefulWidget {
  final Function setActiveCategoryCallback;
  final String activeCategoryName;

  CategoriesList({this.activeCategoryName, this.setActiveCategoryCallback});

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<Category> categories;

  @override
  void initState() {
    super.initState();

    categories = Category.getCategories();
  }

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
            activeCategoryName: widget.activeCategoryName,
            setActiveCategoryCallback: widget.setActiveCategoryCallback,
          ))
              .toList(),
        ),
      ),
    );
  }
}
