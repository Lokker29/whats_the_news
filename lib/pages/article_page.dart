import 'package:flutter/material.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/pages/web_article_page.dart';
import 'package:whats_the_news/resources/text_constants.dart';
import 'package:whats_the_news/views/general_appbar.dart';
import 'package:whats_the_news/views/menu_button.dart';

class ArticlePage extends StatelessWidget {
  final News article;

  ArticlePage({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: _buildBodyContent(context),
      ),
    );
  }

  Widget _buildBodyContent(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          article.getImageWidget(),
          SizedBox(height: 20),
          _buildTitle(),
          Divider(height: 40, thickness: 3, indent: 20, endIndent: 20),
          _buildArticleContent(),
          SizedBox(height: 20),
          _buildBottomActions(context)
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        article.title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildArticleContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        article.content,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildBottomActions(context) {
    return Center(
      child: MenuButton(
        text: TextConstants.goToOriginalArticleButtonText,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebArticlePage(article: article),
          ),
        ),
      ),
    );
  }
}
