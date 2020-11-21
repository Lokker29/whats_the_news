import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/views/general_appbar.dart';

class WebArticlePage extends StatelessWidget {
  final News article;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebArticlePage({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: WebView(
          initialUrl: article.url,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
