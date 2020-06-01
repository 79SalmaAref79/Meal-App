import 'meal.dart';
import 'package:flutter/material.dart';
import 'meal_item.dart';
class Favorites extends StatelessWidget {
final List<Meal> favoriteMeals;
Favorites(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('You have no favorites yet - start adding some'),
      );
    }else{
      return  ListView.builder(
        itemBuilder: (ctx,index){
          return  MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount:  favoriteMeals.length,
      );

    }

  }
}
