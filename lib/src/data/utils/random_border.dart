import 'package:flutter/material.dart';
import 'dart:math';

class BorderColor {
  static final List<Color> _neonColors = [
    Color(0xFF003FFF),
    Color(0xFF9900FF),
    Color(0xFFFF004D),
    Color(0xFF00FF9D),
  ];

  static final Color value = _neonColors[Random().nextInt(_neonColors.length)];
}
