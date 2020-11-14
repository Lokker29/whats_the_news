import 'package:flutter/material.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/assets_urls.dart';

class ListElement extends StatelessWidget {
  final News listElement;
  final double sizedBoxHeight = 10.0;

  ListElement({key, @required this.listElement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _buildImage(),
      Text(
        this.listElement.title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ];

    if (this.listElement.content != null) {
      children.addAll([
        SizedBox(height: this.sizedBoxHeight),
        Text(
          listElement.getShortContent,
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
      ]);
    }

    if (this.listElement.sourceName != null) {
      children.addAll([
        SizedBox(height: this.sizedBoxHeight),
        Text(
          "Source: ${this.listElement.sourceName}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ]);
    }

    if (this.listElement.author != null) {
      children.addAll([
        SizedBox(height: this.sizedBoxHeight),
        Text(
          "Author: ${this.listElement.author}",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ]);
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (listElement.urlToImage != null) {
      print(listElement.getUrlToImage);
      return Image.network(
        listElement.getUrlToImage,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        AssetsUrls.defaultNewsUrl,
        fit: BoxFit.cover,
      );
    }
  }
}
