import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';

import "package:whats_the_news/extensions/string_extensions.dart";

class CategoryTile extends StatefulWidget {
  final Category category;
  final Function setActiveCategoryCallback;
  final String activeCategoryName;

  CategoryTile({
    this.category,
    this.setActiveCategoryCallback,
    this.activeCategoryName,
  });

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  final double _defaultWidth = 120;

  @override
  Widget build(BuildContext context) {
    var columnElements = [_buildStack()];

    if (widget.category.name == widget.activeCategoryName) {
      columnElements.add(SizedBox(height: 5));
      columnElements.add(_buildActiveElement());
    }

    return GestureDetector(
      onTap: () {
        widget.setActiveCategoryCallback(widget.category.name);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: columnElements,
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          child: Image.asset(
            widget.category.imageAssetUrl,
            height: 60,
            width: _defaultWidth,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 60,
          width: _defaultWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: Colors.black26),
          child: Text(
            widget.category.name.capitalize(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActiveElement() {
    return Hero(
      tag: "activeCategoryTile",
      child: Container(
        color: Colors.blueAccent,
        height: 5,
        width: _defaultWidth,
      ),
    );
  }
}

class CategoryTiles extends StatefulWidget {
  final Function setActiveCategoryCallback;
  final String activeCategoryName;

  CategoryTiles({this.activeCategoryName, this.setActiveCategoryCallback});

  @override
  _CategoryTilesState createState() => _CategoryTilesState();
}

class _CategoryTilesState extends State<CategoryTiles> {
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
