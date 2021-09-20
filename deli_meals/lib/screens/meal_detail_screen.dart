import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail-screen";
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      height: (MediaQuery.of(ctx).size.height - kToolbarHeight) * 0.05,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext ctx, Widget child, double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(3, 5),
            blurRadius: 5,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments! as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height:
                  (MediaQuery.of(context).size.height - kToolbarHeight) * 0.3,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 40,
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          meal.ingredients![index],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: meal.ingredients!.length,
              ),
              200,
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(meal.steps![index]),
                      ),
                      Divider(
                        color: index == meal.steps!.length - 1
                            ? Colors.transparent
                            : Colors.grey,
                      ),
                    ],
                  );
                },
                itemCount: meal.steps!.length,
              ),
              350,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
