import 'package:flutter_quizz/src/data/models/question.dart';

class Subcategory {
  final int id;
  final String title;
  final List<Question> questions;

  Subcategory({required this.id, required this.title, required this.questions});
}
