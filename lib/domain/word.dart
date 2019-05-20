import 'package:rtimly/domain/category.dart';
import 'package:rtimly/domain/example.dart';

class Word {
  String plTranslation;
  String engTranslation;
  int difficulty;
  List<Example> engExamples;
  Category category;
  bool isReported;

  Word(this.plTranslation, this.engTranslation, this.difficulty,
      this.engExamples, this.category, this.isReported);
}
