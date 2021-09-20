// ignore: duplicate_ignore
// ignore_for_file: prefer_const_literals_to_create_immutables, duplicate_ignore
// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables

import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal? meal;

  MealItem({@required this.meal});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: meal!);
  }

  String get complexityText {
    switch (meal!.complexity!) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (meal!.affordability!) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
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
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Colors.black54,
                    child: Text(
                      meal!.title!,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${meal!.duration!} min",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        complexityText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        affordabilityText,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
