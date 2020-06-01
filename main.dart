import 'package:flutter/material.dart';
import 'package:mealsapp/category_meals.dart';
import 'package:mealsapp/tabs.dart';
import 'meal.dart';
import 'favorites.dart';
import 'categories.dart';
import 'dummy_data.dart';
import 'meal_detail.dart';
import 'filters.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _avilableMeals=DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];
  void _setFilters( Map<String,bool> filterData){
    setState(() {
      filters=filterData;
      _avilableMeals=DUMMY_MEALS.where((meal){
    if(filters['gluten'] && !meal.isGlutenFree){
  return false;}
    if(filters['lactose'] && !meal.isLactoseFree){
      return false;}
    if(filters['vegan'] && !meal.isVegan){
      return false;}
    if(filters['vegetarian'] && !meal.isVegetarian){
      return false;}
    return true;
    }).toList();
  });
}
void _toggleFavorites(String mealId){
    final existingIndex =
        _favoriteMeals.indexWhere((meal)=>meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId),
        );
      });
    }
}
bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) =>meal.id ==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dish',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.brown,
        canvasColor: Color.fromRGBO(255, 254,229 ,1),
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          )
        ),

      ),
     // home: Categories(),
      // the home also can be called using the following sentence of Named Routes
      initialRoute: '/',
      routes: {
        '/': (ctx) => Tabs(_favoriteMeals),
        Filters.routeName:(ctx)=>Filters(filters,_setFilters),
        CategoryMeals.routeName:(ctx)=> CategoryMeals(_avilableMeals),
        MealDetail.routeName:(ctx)=>MealDetail(_toggleFavorites,_isMealFavorite),
      },
    );
  }
}