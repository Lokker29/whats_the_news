import 'package:flutter/material.dart';
import 'package:whats_the_news/views/category_tiles.dart';
import 'package:whats_the_news/views/news_stream_builder.dart';

class ListOfNews extends StatefulWidget {
  final String activeCategoryName;

  ListOfNews(this.activeCategoryName);

  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
  ValueNotifier activeCategoryName;

  @override
  void initState() {
    super.initState();

    activeCategoryName = ValueNotifier(widget.activeCategoryName);
  }

  void changeActiveCategory(String categoryName) {
    if (activeCategoryName.value != categoryName) {
      activeCategoryName.value = categoryName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: activeCategoryName,
          builder: (context, newName, child) {
            return CategoryTiles(
                activeCategoryName: activeCategoryName.value,
                setActiveCategoryCallback: changeActiveCategory
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: activeCategoryName,
          // child: NewsStreamBuilder(activeCategoryName.value),
          builder: (context, newName, child) {
            return NewsStreamBuilder(
              newName,
              key: UniqueKey(),
            );
          },
        ),
      ],
    );
  }
}
