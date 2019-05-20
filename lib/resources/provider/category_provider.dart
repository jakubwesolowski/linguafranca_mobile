import 'dart:async';
import 'package:rtimly/domain/category.dart';

abstract class CategoryProvider {
  Future<List<Category>> getCategories();

  Future<void> addCategory(Category category);

  Future<void> removeCategory(Category category);
}

class DatabaseCategoryProvider implements CategoryProvider {
  static List<Category> _categories = new List<Category>();

  @override
  Future<List<Category>> getCategories() async {
    return _categories;
  }

  @override
  Future<void> addCategory(Category category) async {
    _categories.add(category);
    return null;
  }

  @override
  Future<void> removeCategory(Category category) {
    _categories.remove(category);
    return null;
  }
}
