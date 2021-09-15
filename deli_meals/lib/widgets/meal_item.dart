// ignore: duplicate_ignore
// ignore_for_file: prefer_const_literals_to_create_immutables, duplicate_ignore
// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal? meal;

  MealItem({@required this.meal});

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      15,
                    ),
                    topRight: Radius.circular(
                      15,
                    ),
                  ),
                  child: Image.network(
                    meal!.imageUrl!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
