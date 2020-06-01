import 'package:flutter/material.dart';
import 'package:mealsapp/category_meals.dart';
import 'dummy_data.dart';
import 'category.dart';

class CategoryItem extends StatelessWidget {

  void selectcategoy(BuildContext ctx) {
//Navigator.of(ctx).push(MaterialPageRoute(builder: (_)
    Navigator.of(ctx)
        .pushNamed(CategoryMeals.routeName, arguments: {'id': id, 'title': title});
    {
      //return CategoryMeals(id,title);));
    }
  }

  final String id;
  final String title;
  final Color color;
  CategoryItem(this.title, this.color, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategoy(context),
      splashColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(15),
      // should match the border radius of the container’s decoration
      child: Container(
        padding: const EdgeInsets.all(15),
        // we use const here because when this build method reruns, this object here will not be recreated because Flutter
        //detects that it's constant (so we make the performance better)
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
