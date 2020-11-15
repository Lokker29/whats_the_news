import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/views/list_of_news.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = '/news';

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
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _activeTextMode,
        builder: (context, newValue, child) {
          return newValue ? Container() : _buildFloatActionButton();
        },
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => SystemNavigator.pop(),
          ),
          title: Text(
            StringConstants.mainTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true),
      body: Container(
        child: Stack(
          children: [
            Container(child: ListOfNews(categoryName, _searchController.text)),
            _buildTextInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () => _activeTextMode.value = true,
      child: Icon(Icons.search),
      backgroundColor: Theme.of(context).primaryColor,
    );
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
                    onPressed: () => setState(() {_activeTextMode.value = false;}),
                    icon: Icon(Icons.search),
                  )),
            ),
          ),
        );
      },
    );
  }
}
