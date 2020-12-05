import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/assets_urls.dart';

class News {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String get sourceName {
    return this.source != null ? this.source.name : null;
  }

  News.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }

  String get getUrlToImage {
    return urlToImage.startsWith('//') ? 'https:' + urlToImage : urlToImage;
  }

  String get getShortContent {
    var lengthContentDisplayed = 200;
    return content.length < lengthContentDisplayed
        ? content
        : content.substring(0, lengthContentDisplayed) + '...';
  }

  Widget getImageWidget() {
    return this.urlToImage != null
        ? Image.network(this.getUrlToImage, fit: BoxFit.cover)
        : Image.asset(AssetsUrls.defaultNewsUrl, fit: BoxFit.cover);
  }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
