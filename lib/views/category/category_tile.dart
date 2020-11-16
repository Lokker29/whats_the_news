import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_news/models/category.dart';

import "package:whats_the_news/extensions/string_extensions.dart";
import 'package:whats_the_news/services/blocs/category_bloc.dart';

class CategoryTile extends StatefulWidget {
  final Category category;

  CategoryTile({@required this.category});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  final double _defaultWidth = 120;

  @override
  Widget build(BuildContext context) {
    CategoryBloc _bloc = BlocProvider.of<CategoryBloc>(context);

    return GestureDetector(
      onTap: () {
        _bloc.add(Category.getEnumNameByCategory(widget.category));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            _buildStack(),
            _buildBottomElement(),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          child: Image.asset(
            widget.category.imageAssetUrl,
            height: 60,
            width: _defaultWidth,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 60,
          width: _defaultWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: Colors.black26),
          child: Text(
            widget.category.name.capitalize(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomElement() {
    return BlocBuilder<CategoryBloc, Category>(
      builder: (context, state) {
        if (state != widget.category) return Container();

        return Column(
          children: [
            SizedBox(height: 5),
            _buildActiveElement(),
          ],
        );
      },
    );
  }

  Widget _buildActiveElement() {
    return Container(
      color: Colors.blueAccent,
      height: 5,
      width: _defaultWidth,
    );
  }
}
