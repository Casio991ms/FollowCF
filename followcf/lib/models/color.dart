import 'package:flutter/material.dart';

Color getColor(String rank) {
  switch (rank) {
    case "newbie":
      return const Color(0xFF808080);
    case "pupil":
      return const Color(0xFF008000);
    case "specialist":
      return const Color(0xFF03A89E);
    case "expert":
      return const Color(0xFF0000FE);
    case "candidate master":
      return const Color(0xFFAA00BB);
    case "master":
      return const Color(0xFFFF8C00);
    case "international master":
      return const Color(0xFFFF8C00);
    case "grandmaster":
      return const Color(0xFFFF0000);
    case "international grandmaster":
      return const Color(0xFFFF0000);
    case "legendary grandmaster":
      return const Color(0xFFFF0000);
    default:
      return const Color(0xFFFFFFFF);
  }
}
