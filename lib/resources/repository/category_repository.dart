import 'dart:async';
import 'package:rtimly/domain/category.dart';
import 'package:rtimly/resources/provider/category_provider.dart';

abstract class CategoryRepository {
  Future<List<Category>> fetchAllCategories();

  Future<void> addCategory(Category category);

  Future<void> removeCategory(Category category);
}

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryProvider categoryProvider = DatabaseCategoryProvider();

  Future<List<Category>> fetchAllCategories() =>
      categoryProvider.getCategories();

  @override
  Future<void> addCategory(Category category) async {
    categoryProvider.addCategory(category);
    return null;
  }

  @override
  Future<void> removeCategory(Category category) {
    categoryProvider.removeCategory(category);
    return null;
  }
}
