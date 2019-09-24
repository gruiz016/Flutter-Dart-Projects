import 'package:flutter/material.dart';

import 'package:receipe_app/dummy-data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildContainer(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildItemContainer(BuildContext context, Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: (MediaQuery.of(context).size.height) * 0.3,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height) * 0.3,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildContainer(context, 'Ingredients'),
              buildItemContainer(
                context,
                ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  itemBuilder: (ctx, index) => Card(
                    elevation: 0,
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildContainer(context, 'Steps'),
              buildItemContainer(
                context,
                ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
