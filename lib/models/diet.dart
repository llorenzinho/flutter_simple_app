import 'package:flutter/material.dart';

class DietModel {
  final IconData icon;
  final bool isActive;
  final String title;
  final String difficulty;
  final int minutes;
  final int kcal;
  final Color color;

  const DietModel(
      {required this.icon,
      required this.isActive,
      required this.title,
      required this.difficulty,
      required this.minutes,
      required this.kcal,
      required this.color});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        icon: Icons.abc,
        isActive: true,
        title: "Honey Pancake",
        difficulty: 'Easy',
        minutes: 30,
        kcal: 180,
        color: Colors.blue.withOpacity(0.11)));

    diets.add(DietModel(
      icon: Icons.abc,
      isActive: false,
      title: "Honey Pancake",
      difficulty: 'Easy',
      minutes: 30,
      kcal: 180,
      color: Colors.pink.withOpacity(0.11),
    ));

    diets.add(DietModel(
        icon: Icons.abc,
        isActive: false,
        title: "Honey Pancake",
        difficulty: 'Easy',
        minutes: 30,
        kcal: 180,
        color: Colors.blue.withOpacity(0.11)));

    diets.add(DietModel(
        icon: Icons.abc,
        isActive: false,
        title: "Honey Pancake",
        difficulty: 'Easy',
        minutes: 30,
        kcal: 180,
        color: Colors.pink.withOpacity(0.11)));

    return diets;
  }
}
