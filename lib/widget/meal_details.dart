import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavourite});

  final void Function(Meal meal) onToggleFavourite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavourite(meal);
              },
              icon: const Icon(Icons.star)),
        ],
      ),
      body: Image.network(
        meal.imageUrl,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
