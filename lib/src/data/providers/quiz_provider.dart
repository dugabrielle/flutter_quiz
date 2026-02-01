import 'package:flutter/material.dart';
import 'package:flutter_quizz/src/data/models/question.dart';
import 'package:flutter_quizz/src/data/models/subcategory.dart';

class QuizProvider extends ChangeNotifier {
  // subcategorias do json
  List<Subcategory> subcategories = [];

  // index da subcategoria e da questão
  int subcategoryIndex = 0;
  int questionIndex = 0;

  // estado da questão atual
  int selected = -1;
  bool disabled = false;
  int tries = 0;
  final int maxTries = 3;

  // aponta para a questão atual com base na subcategoria e no índice da questão
  Question get currentQuestion =>
      subcategories[subcategoryIndex].questions[questionIndex];

  // seleciona a questão selecionada e atualiza o estado do quiz
  void selectOption(int index) {
    if (disabled) return;

    selected = index;

    if (currentQuestion.options[index] == currentQuestion.correct) {
      disabled = true;
    } else {
      tries++;
      if (tries >= maxTries) {
        disabled = true;
      }
    }

    notifyListeners();
  }
}
