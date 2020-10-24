import 'package:flutter/material.dart';
import 'package:whats_the_news/settings.dart';

class ListElement extends StatelessWidget {
  final Map listElement;
  final double sizedBoxHeight = 10.0;
  final int lengthContentDisplayed = 200;

  ListElement({key, @required this.listElement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.listElement);

    List<Widget> children = [
      Text(
        this.listElement['title'],
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ];

    if (this.listElement['content'] != null) {
      String text = this.listElement['content'].length < this.lengthContentDisplayed
          ? this.listElement['content']
          : (this.listElement['content'].substring(0, this.lengthContentDisplayed) + '...');

      children.addAll([
        SizedBox(height: this.sizedBoxHeight),
        Text(
          '"$text"',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
      ]);
    }

    if (this.listElement['source']['name'] != null) {
      children.addAll([
        SizedBox(height: this.sizedBoxHeight),
        Text(
          "Source: ${this.listElement['source']['name']}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ]);
    }

    if (this.listElement['author'] != null) {
      children.addAll([
        SizedBox(height: this.sizedBoxHeight),
        Text(
          "Author: ${this.listElement['author']}",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ]);
    }

    return Card(
      child: Container(
        color: DEFAULT_CARD_BACKGROUND_COLOR,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
