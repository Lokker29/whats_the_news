import 'package:flutter/cupertino.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/resources/api_settings.dart';

class APIFilters {
  final String query;
  final int page;
  final int pageSize;
  final Category category;
  final String country;

  APIFilters({
    @required this.page,
    @required this.category,
    this.query,
    pageSize,
    country,
  })  : this.country = country ?? APISettings.defaultCountry,
        this.pageSize = pageSize ?? APISettings.defaultPageSize;

  Map<String, dynamic> toJson() {
    return {
      'q': this.query,
      'page': this.page,
      'category': this.category?.name,
      'pageSize': this.pageSize,
      'country': this.country,
    };
  }
}
