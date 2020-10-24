import 'package:flutter/material.dart';
import 'package:whats_the_news/logics/NewsApi.dart';
import 'package:whats_the_news/widgets/ErrorAlert.dart';
import 'package:whats_the_news/widgets/Spinkit.dart';

class ListOfNews extends StatefulWidget {
  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
  final NewsAPI newsApiClient = NewsAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.newsApiClient.everything(),
        builder: (context, snapshot) {
          return createNewsListView(context, snapshot);
        });
  }

  Widget createNewsListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      var values = snapshot.data;

      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text('item $index');
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: values.length,
      );
    } else if (snapshot.hasError) {
      return ErrorAlert();
    } else {
      return spinkit;
    }
  }
}
