import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/assets_urls.dart';

class Category {
  final String name;
  final String imageAssetUrl;

  Category({@required this.name, @required this.imageAssetUrl});

  static List<Category> getCategories() {
    return [
      Category(name: 'general', imageAssetUrl: AssetsUrls.generalUrl),
      Category(name: 'business', imageAssetUrl: AssetsUrls.businessUrl),
      Category(name: 'entertainment', imageAssetUrl: AssetsUrls.entertainmentsUrl),
      Category(name: 'health', imageAssetUrl: AssetsUrls.healthUrl),
      Category(name: 'science', imageAssetUrl: AssetsUrls.scienceUrl),
      Category(name: 'sports', imageAssetUrl: AssetsUrls.sportsUrl),
      Category(name: 'technology', imageAssetUrl: AssetsUrls.technologyUrl),
    ];
  }
}
