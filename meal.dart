import 'package:flutter/foundation.dart';
//to unlock @required decorator
import 'package:flutter/material.dart';
enum Complexity{
  Simple,
  Challenging,
  Hard,
 // behind the scenes, what Dart does is it simply uses 0, 1 and 2 here, it maps these values
}
enum Affordability{
   Pricey,
  Affordable,
  Luxurious
}
class Meal{

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;


  const Meal({@required this.id,@required this.categories,@required this.title,
    @required this.imageUrl,@required this.ingredients,@required this.steps,
  @required this.duration,@required this.affordability,
  @required this.complexity,@required this.isGlutenFree,
  @required this.isLactoseFree,@required this.isVegan,@required this.isVegetarian

  });
}
