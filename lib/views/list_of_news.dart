import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/services/news_api_client.dart';
import 'package:whats_the_news/views/error_alert.dart';
import 'package:whats_the_news/views/news_element.dart';
import 'package:whats_the_news/views/loader_spinkit.dart';

class ListOfNews extends StatefulWidget {
  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
  final NewsAPI newsApiClient = NewsAPI();

  void rerunBuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.newsApiClient.getEverything(),
        builder: (context, snapshot) {
          return _createNewsListView(context, snapshot);
        });
  }

  Widget _createNewsListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      var values = snapshot.data;

      if ((values as List<dynamic>).isEmpty) {
        return Text(
          StringConstants.emptyListOfNewsText,
          style: TextStyle(
            fontSize: 20.0,
            height: 1.5,
            fontWeight: FontWeight.w500
          ),
        );
      }

      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListElement(listElement: values[index]);
        },
        itemCount: values.length,
      );
    } else if (snapshot.hasError) {
      return ErrorAlert(rerunBuild);
    } else {
      return LoaderSpinkit();
    }
  }
}
