import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/assets_urls.dart';

enum CategoryName {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology
}

class Category {
  final String name;
  final String imageAssetUrl;

  Category({@required this.name, @required this.imageAssetUrl});

  static Map<CategoryName, String> _categoryNameToString = {
    CategoryName.general: 'general',
    CategoryName.business: 'business',
    CategoryName.entertainment: 'entertainment',
    CategoryName.health: 'health',
    CategoryName.science: 'science',
    CategoryName.sports: 'sports',
    CategoryName.technology: 'technology',
  };

  static List<Category> getCategories() {
    return [
      Category(name: 'general', imageAssetUrl: AssetsUrls.generalUrl),
      Category(name: 'business', imageAssetUrl: AssetsUrls.businessUrl),
      Category(
          name: 'entertainment', imageAssetUrl: AssetsUrls.entertainmentsUrl),
      Category(name: 'health', imageAssetUrl: AssetsUrls.healthUrl),
      Category(name: 'science', imageAssetUrl: AssetsUrls.scienceUrl),
      Category(name: 'sports', imageAssetUrl: AssetsUrls.sportsUrl),
      Category(name: 'technology', imageAssetUrl: AssetsUrls.technologyUrl),
    ];
  }

  static Category get getDefaultCategory {
    return Category.getCategoryByEnumName(CategoryName.general);
  }

  static Category getCategoryByEnumName(CategoryName categoryName) {
    return Category.getCategories().firstWhere(
        (element) => element.name == _categoryNameToString[categoryName]);
  }

  static CategoryName getEnumNameByCategory(Category category) {
    return _categoryNameToString
        .map((key, value) => MapEntry(value, key))[category.name];
  }

  bool operator ==(Object other) {
    return other is Category && other.name == this.name;
  }

  @override
  int get hashCode => super.hashCode;
}
