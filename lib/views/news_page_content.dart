import 'package:flutter/material.dart';
import 'package:whats_the_news/views/news/news_list.dart';

import 'category/categories_list.dart';

class NewsPageContent extends StatefulWidget {
  final String activeCategoryName;
  final String searchText;

  NewsPageContent(this.activeCategoryName, this.searchText);

  @override
  _NewsPageContentState createState() => _NewsPageContentState();
}

class _NewsPageContentState extends State<NewsPageContent> {
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
        _buildCategories(),
        _buildNews(),
      ],
    );
  }

  Widget _buildCategories() {
    return ValueListenableBuilder(
      valueListenable: activeCategoryName,
      builder: (context, newName, child) {
        return CategoriesList(
            activeCategoryName: activeCategoryName.value,
            setActiveCategoryCallback: changeActiveCategory);
      },
    );
  }

  Widget _buildNews() {
    return ValueListenableBuilder(
      valueListenable: activeCategoryName,
      builder: (context, newName, child) {
        return NewsList(
          newName,
          widget.searchText,
          key: UniqueKey(),
        );
      },
    );
  }
}
