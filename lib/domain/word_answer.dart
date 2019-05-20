import 'package:rtimly/domain/collection.dart';
import 'package:rtimly/domain/word.dart';

class WordAnswer {
  Word word;
  Collection collection;
  int correctAnswers;
  int incorrectAnswers;
  int counter;

  WordAnswer(this.word, this.collection, this.correctAnswers,
      this.incorrectAnswers, this.counter);
}
