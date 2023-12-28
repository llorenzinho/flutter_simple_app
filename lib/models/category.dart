import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final Color backgroundColor;
  final IconData icon;

  const CategoryModel(
      {required this.name, required this.backgroundColor, required this.icon});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Salad',
        backgroundColor: Colors.blue.withOpacity(0.11),
        icon: Icons.abc));

    categories.add(CategoryModel(
        name: 'Cacke',
        backgroundColor: Colors.pink.withOpacity(0.11),
        icon: Icons.abc));

    categories.add(CategoryModel(
        name: 'Pie',
        backgroundColor: Colors.blue.withOpacity(0.11),
        icon: Icons.abc));

    categories.add(CategoryModel(
        name: 'Smooties',
        backgroundColor: Colors.pink.withOpacity(0.11),
        icon: Icons.abc));

    return categories;
  }
}
