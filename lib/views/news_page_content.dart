import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/services/news_bloc.dart';
import 'package:whats_the_news/views/news/news_list.dart';

import 'category/categories_list.dart';

class NewsPageContent extends StatelessWidget {
  final String searchText;

  NewsPageContent(this.searchText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesList(),
        _buildNews(),
      ],
    );
  }

  Widget _buildNews() {
    return BlocBuilder<CategoryBloc, Category>(
      builder: (context, state) {
        return NewsList(
          state.name,
          searchText,
          key: UniqueKey(),
        );
      },
    );
  }

}
