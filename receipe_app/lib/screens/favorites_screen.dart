import 'package:flutter/material.dart';

import 'package:receipe_app/models/meals.dart';
import 'package:receipe_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Favorites - Nothing yet, please add!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
