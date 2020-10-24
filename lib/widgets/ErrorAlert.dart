import 'package:flutter/material.dart';
import 'package:whats_the_news/widgets/MenuButton.dart';

class ErrorAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Oups! There was an error'),
      content: MenuButton(
        text: 'Go to home page',
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
    );
  }
}
