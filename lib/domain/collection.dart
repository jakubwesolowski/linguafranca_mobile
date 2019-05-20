import 'package:rtimly/domain/category.dart';
import 'package:rtimly/domain/user.dart';

class Collection {
  User user;
  bool isModifiable;
  int learningProcess;
  Category category;

  Collection(this.user, this.isModifiable, this.learningProcess, this.category);
}
