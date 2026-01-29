import 'package:flutter/material.dart';

class Question {
  final int id;
  final String image;
  final List<String> options;
  final String correct;

  Question({
    required this.id,
    required this.image,
    required this.options,
    required this.correct,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['questionId'] as int,
      image: json['questionImg'] as String,
      options: List<String>.from(json['options']),
      correct: json['correct'] as String,
    );
  }
}
