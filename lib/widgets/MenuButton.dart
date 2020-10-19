import 'package:flutter/material.dart';
import 'package:whats_the_news/settings.dart';

class MenuButton extends StatelessWidget {
  final String text;
  double menuBtnsWidth = 20.0;
  double menuBtnsBorderRadius = 10.0;
  double minWidth = 140.0;
  final Function onPressed;

  MenuButton({key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: this.onPressed,
        minWidth: this.minWidth,
        color: DEFAULT_PROJECT_COLOR,
        textColor: DEFAULT_PROJECT_TEXT_COLOR,
        child: Text(
          this.text,
          style: TextStyle(fontSize: this.menuBtnsWidth),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.menuBtnsBorderRadius)));
  }
}
