import 'package:deli_meals/widgets/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments! as Map<String?, String?>;
    final categoryId = routeArgs['id'];
    final categotyTitle = routeArgs['title'];

    final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Recipes"),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
