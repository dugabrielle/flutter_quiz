import 'package:flutter_quizz/src/data/models/category.dart';

class CategoryList {
  final List<Category> basic;
  final List<Category> intermediate;
  final List<Category> advanced;

  CategoryList({
    required this.basic,
    required this.intermediate,
    required this.advanced,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    List<Category> basicCategory = [];
    List<Category> intermediateCategory = [];
    List<Category> advancedCategory = [];

    if (json['basic'] != null) {
      for (var item in json['basic']) {
        basicCategory.add(Category.fromJson(item));
      }
    }
    if (json['intermediate'] != null) {
      for (var item in json['intermediate']) {
        intermediateCategory.add(Category.fromJson(item));
      }
    }
    if (json['advanced'] != null) {
      for (var item in json['advanced']) {
        advancedCategory.add(Category.fromJson(item));
      }
    }
    return CategoryList(
      basic: basicCategory,
      intermediate: intermediateCategory,
      advanced: advancedCategory,
    );
  }
}
