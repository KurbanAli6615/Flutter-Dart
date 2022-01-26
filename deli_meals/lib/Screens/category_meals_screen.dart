import 'package:deli_meals/Data/dummy_data.dart';
import 'package:deli_meals/Models/meal.dart';
import 'package:deli_meals/Widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals-screen';

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routesArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routesArgs['title'] ?? ""),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
