import 'package:flutter_quizz/src/data/models/question.dart';

class Subcategory {
  final int id;
  final String title;
  final List<Question> questions;

  Subcategory({required this.id, required this.title, required this.questions});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['subcategoryId'] as int,
      title: json['subcategoryTitle'],
      questions:
          (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
    );
  }
}
