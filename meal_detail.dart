import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'dummy_data.dart';
class MealDetail extends StatelessWidget {
  static const routeName ='/meal_detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetail(this.toggleFavorite,this.isFavorite);
   Widget buildSectionTitle(BuildContext context,String text){
     return Container(
       child: Text(text,
         style: TextStyle(
           fontSize: 23,
         ),),
     );
   }
   Widget buildcontainer( Widget child){
      return Container(
         // we use it as if we use the ListView directly we will face the problem
         // that listView take infinite height
         decoration: BoxDecoration(
         color: Colors.white,
         border: Border.all(color: Colors.grey),
     borderRadius: BorderRadius.circular(10),
     ),
     margin: EdgeInsets.all(10),
     padding: EdgeInsets.all(10),
     height: 150,
     width: 300,
     child: child,);
   }
  @override
  Widget build(BuildContext context) {
    final mealId =ModalRoute.of(context).settings.arguments as String;
    final selectedMeal= DUMMY_MEALS.firstWhere((meal)=> meal.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,
              fit: BoxFit.cover,),
            ),
             buildSectionTitle(context, 'Ingredients'),
             buildcontainer(
              ListView.builder(
                  itemCount:selectedMeal.ingredients.length
                  ,itemBuilder: (ctx,index)=>Card(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              )
              ),
            ),
            buildSectionTitle(context,'Steps'),
            buildcontainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder:(ctx,index)  => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child :Icon(
           isFavorite(mealId)? Icons.star : Icons.star_border,
        ),
        onPressed:() => toggleFavorite(mealId),
      ),
    ) ;
  }
}
