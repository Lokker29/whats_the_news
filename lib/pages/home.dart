import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whats_the_news/settings.dart';
import 'package:whats_the_news/widgets/MenuButton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double width = 140.0;
  final double menuBtnsWidth = 20.0;
  final double menuBtnsBorderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DEFAULT_PROJECT_COLOR,
        title: Text("What's the news?", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(text: "Read news!",
                onPressed: () => Navigator.pushNamed(context, '/news')),
            SizedBox(height: 10),
            MenuButton(text: "Quit", onPressed: () => SystemNavigator.pop()),
            // FlatButton(
            //     onPressed: () => SystemNavigator.pop(),
            //     minWidth: this.width,
            //     color: Colors.amber,
            //     textColor: Colors.white,
            //     child: Text(
            //       "Quit!",
            //       style: TextStyle(fontSize: this.menuBtnsWidth),
            //     ),
            //     shape: RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.circular(this.menuBtnsBorderRadius)))
          ],
        ),
      ),
    );
  }
}
