import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';

import "package:whats_the_news/extensions/string_extensions.dart";
import 'package:whats_the_news/pages/news_page.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final double _defaultWidth = 120;

  CategoryTile({this.category});

  @override
  Widget build(BuildContext context) {
    var activeCategoryName = ModalRoute.of(context).settings.arguments;
    var columnElements = [_buildStack()];

    if (category.name == activeCategoryName) {
      columnElements.add(SizedBox(height: 5));
      columnElements.add(_buildActiveElement());
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsPage(),
            settings: RouteSettings(
              arguments: category.name,
            ),
          ),
        );
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
            category.imageAssetUrl,
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
            category.name.capitalize(),
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
    return Container(
      color: Colors.blueAccent,
      height: 5,
      width: _defaultWidth,
    );
  }
}

class CategoryTiles extends StatefulWidget {
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryTile(category: categories[index]);
          },
        ));
  }
}
