import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final double menuButtonsWidth = 20.0;
  final Function onPressed;

  MenuButton({key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: TextStyle(fontSize: this.menuButtonsWidth),
      ),
    );
  }
}
