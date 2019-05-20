import 'package:rtimly/domain/category.dart';
import 'package:rtimly/dto/category_model.dart';
import 'package:rtimly/resources/repository/category_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CategoryBloc {
  final CategoryRepository _repository =
      kiwi.Container().resolve<CategoryRepository>();

  final _categoryFetcher = PublishSubject<CategoryModel>();

  Observable<CategoryModel> get allCategories => _categoryFetcher.stream;

  fetchAllCategories() async {
    List<Category> categories = await _repository.fetchAllCategories();

    _categoryFetcher.sink.add(CategoryModel(categories));

//    categories.forEach(
//        (category) => _categoryFetcher.sink.add(CategoryModel(categories)));

//    _categoryFetcher.sink.add(categories);
  }

//  addCategory(Category category){
//    _categoryFetcher.
//  }

  dispose() {
    _categoryFetcher.close();
  }
}

final bloc = CategoryBloc();
