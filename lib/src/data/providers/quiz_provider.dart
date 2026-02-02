import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quizz/src/data/models/question.dart';
import 'package:flutter_quizz/src/data/models/subcategory.dart';

class QuizProvider extends ChangeNotifier {
  // subcategorias do json
  List<Subcategory> subcategories = [];

  // loadData

  Future<void> loadAllData() async {
    if (subcategories.isNotEmpty) return;

    final String response = await rootBundle.loadString(
      'assets/json/subcategories.json',
    );
    final data = json.decode(response);
    final List<dynamic> quizList = data['quizzes'];

    subcategories = quizList.map((sub) => Subcategory.fromJson(sub)).toList();
    notifyListeners();
  }

  // index da subcategoria e da questão
  int subcategoryIndex = 0;
  int questionIndex = 0;

  // estado da questão atual
  Map<int, int> savedSelected = {};
  Map<int, bool> savedDisabled = {};
  Map<int, int> savedTries = {};
  final int maxTries = 3;

  // aponta para a questão atual com base na subcategoria e no índice da questão
  Question? get currentQuestion {
    if (subcategories.isEmpty || subcategoryIndex >= subcategories.length) {
      return null;
    }
    final questions = subcategories[subcategoryIndex].questions;
    if (questionIndex >= questions.length) {
      return null;
    }
    return questions[questionIndex];
  }

  // estado da questão
  int get selected => savedSelected[currentQuestion?.id] ?? -1;
  bool get disabled => savedDisabled[currentQuestion?.id] ?? false;
  int get tries => savedTries[currentQuestion?.id] ?? 0;

  // retorna o índice correto
  int get correctIndex {
    final q = currentQuestion;
    if (q == null) return -1;

    return q.options.indexWhere(
      (option) => option.trim().toLowerCase() == q.correct.trim().toLowerCase(),
    );
  }

  // seleciona a questão selecionada e atualiza o estado do quiz
  void selectOption(int index) {
    final question = currentQuestion;
    if (question == null || disabled) return;

    savedSelected[question.id] = index;

    if (question.options[index] == question.correct) {
      savedDisabled[question.id] = true;
    } else {
      int currentTries = (savedTries[question.id] ?? 0) + 1;
      savedTries[question.id] = currentTries;
      if (currentTries >= maxTries) {
        savedDisabled[question.id] = true;
      }
    }

    notifyListeners();
  }

  // próxima questão
  void nextQuestion() {
    if (questionIndex < subcategories[subcategoryIndex].questions.length - 1) {
      questionIndex++;
      notifyListeners();
    }
  }

  // voltar
  void previousQuestion() {
    if (questionIndex > 0) {
      questionIndex--;
      notifyListeners();
    }
  }

  // reseta o estado da questão
  void resetQuestion() {
    final question = currentQuestion;
    if (question != null) {
      savedSelected.remove(question.id);
      savedDisabled.remove(question.id);
      savedTries.remove(question.id);
    }
    notifyListeners();
  }

  // define a subcategoria selecionada
  void setSubcategory(int index) {
    subcategoryIndex = index;
    questionIndex = 0;
    notifyListeners();
  }

  // carrega os dados do json
  void loadSubcategories(List<Subcategory> data) {
    subcategories = data;
    notifyListeners();
  }

  // categoria do quiz pelo título
  void setSubcategoryByTitle(String title) {
    final index = subcategories.indexWhere(
      (sub) => sub.title.trim().toLowerCase() == title.trim().toLowerCase(),
    );

    if (index != -1) {
      subcategoryIndex = index;
      questionIndex = 0;

      savedSelected.clear();
      savedDisabled.clear();
      savedTries.clear();
      notifyListeners();
    } else {
      debugPrint("'$title' não encontrada.");
    }
  }
}
