import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_news/models/category.dart';

class CategoryBloc extends Bloc<CategoryName, Category> {
  CategoryBloc(Category initialState) : super(initialState);

  @override
  Stream<Category> mapEventToState(CategoryName event) async* {
    yield Category.getCategoryByEnumName(event);
  }
}
