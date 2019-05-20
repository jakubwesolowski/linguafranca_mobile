import 'package:rtimly/domain/category.dart';

class CategoryModel {
  List<Category> _categories;

  CategoryModel(this._categories);

  List<Category> get categories => _categories;
}
