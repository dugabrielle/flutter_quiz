import 'package:flutter/material.dart';

Color answerBtnColor({
  required bool disabled,
  required int index,
  required int selected,
  required int correct,
}) {
  if (index == selected && index == correct) {
    return Colors.green;
  } else if (index == selected && index != correct) {
    return Colors.red;
  }

  if (disabled) {
    return Colors.grey[700]!;
  }

  return Colors.transparent;
}
