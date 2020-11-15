import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whats_the_news/resources/text_constants.dart';
import 'package:whats_the_news/views/news_page_content.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ValueNotifier _activeTextMode = ValueNotifier(false);
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var categoryName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: _buildFloatActionButton(),
      appBar: _buildAppBar(),
      body: Container(
        child: Stack(
          children: [
            Container(child: NewsPageContent(categoryName, _searchController.text)),
            _buildTextInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatActionButton() {
    return ValueListenableBuilder(
      valueListenable: _activeTextMode,
      builder: (context, newValue, child) {
        return newValue
            ? Container()
            : FloatingActionButton(
                onPressed: () => _activeTextMode.value = true,
                child: Icon(Icons.search),
                backgroundColor: Theme.of(context).primaryColor,
              );
      },
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => SystemNavigator.pop(),
        ),
        title: Text(
          TextConstants.mainTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true);
  }

  Widget _buildTextInput() {
    return ValueListenableBuilder(
      valueListenable: _activeTextMode,
      builder: (context, newValue, child) {
        if (!newValue) return Container();

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.black26,
          ),
          child: Center(
            child: TextField(
              autofocus: true,
              controller: _searchController,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      _activeTextMode.value = false;
                    }),
                    icon: Icon(Icons.search),
                  )),
            ),
          ),
        );
      },
    );
  }
}