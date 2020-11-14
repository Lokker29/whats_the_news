import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/views/menu_button.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        StringConstants.mainTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
                text: StringConstants.goToNewsButtonText,
                onPressed: () => Navigator.of(context).pushNamed('/news')),
            SizedBox(height: 10),
            MenuButton(text: "Test", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
