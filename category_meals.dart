
 import"package:flutter/material.dart";
import 'package:mealsapp/meal_item.dart';
import 'meal_item.dart';
import 'meal.dart';
class CategoryMeals extends StatefulWidget{
  //final  String categoryid;
  //final String categorytitle;
  static const routeName ='/category_meals';
final List <Meal> availablemeals;
CategoryMeals(this.availablemeals);
  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData =false;
  @override
  void didChangeDependencies() {
    if(! _loadedInitData){
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    categoryTitle = routeArgs['title'];
    final categoryId =routeArgs['id'];
    displayedMeals= widget.availablemeals.where((meal){
      return meal.categories.contains(categoryId);}).toList();
    _loadedInitData=true;}
    super.didChangeDependencies();
  }
  void initState(){
//...
  }
  void removeMeal( String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id ==mealId);
    });
  }
  Widget build(BuildContext context) {

    //CategoryMeals(this.categoryid,this.categorytitle);

    //contains method and contains returns true if that list contains a specific value.
    return Scaffold(
    appBar: AppBar(
    title: Text(categoryTitle),
    ),body:  ListView.builder(
      itemBuilder: (ctx,index){
        return  MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          affordability: displayedMeals[index].affordability,
          duration: displayedMeals[index].duration,
          complexity: displayedMeals[index].complexity,

        );
      },
      itemCount: displayedMeals.length,
    )
    );
  }

}
