import 'package:rtimly/domain/user.dart';

class Category {
  String name;
  String description;
  User owner;
  bool isPublic;
  int difficulty;

  Category.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    description = parsedJson['description'];
    owner = parsedJson['owner'];
    isPublic = parsedJson['isPublic'];
    difficulty = parsedJson['difficulty'];
  }

  Category(
      this.name, this.description, this.owner, this.isPublic, this.difficulty);
}
