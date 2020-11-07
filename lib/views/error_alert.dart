import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/views/menu_button.dart';

class ErrorAlert extends StatelessWidget {
  final Function callbackOnClick;

  ErrorAlert(this.callbackOnClick);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(StringConstants.errorAlertTitle),
      content: MenuButton(
        text: StringConstants.errorAlertText,
        onPressed: callbackOnClick,
      ),
    );
  }
}
