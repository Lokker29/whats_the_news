import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/text_constants.dart';

class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  GeneralAppBar() : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        TextConstants.mainTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }
}
