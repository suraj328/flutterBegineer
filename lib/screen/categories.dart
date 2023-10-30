import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:meal_app/widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _categoryScreen(BuildContext context, Category category) {
    final filterMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // routing from one screen to another
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filterMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick your category'),
      ),
      // instead of this gridview we can also use grid view builder for dynamic content
      body: GridView(
        padding: const EdgeInsets.all(24),
        // default its top to bottom, when we set crossAxisCount:2 ,it looks left to right for manging grod wodget
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _categoryScreen(context, category);
              },
            )
        ],
      ),
    );
  }
}
