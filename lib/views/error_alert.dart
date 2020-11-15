import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/text_constants.dart';
import 'package:whats_the_news/views/menu_button.dart';

class ErrorAlert extends StatelessWidget {
  final Function callbackOnClick;

  ErrorAlert(this.callbackOnClick);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(TextConstants.errorAlertTitle),
      content: MenuButton(
        text: TextConstants.errorAlertText,
        onPressed: callbackOnClick,
      ),
    );
  }
}
