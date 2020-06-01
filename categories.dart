import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_item.dart';
import 'dummy_data.dart';

class Categories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:  const EdgeInsets.all(15),
        children:
          DUMMY_CATEGORIES.map((catData)=>CategoryItem(
            catData.title,
            catData.color,
            catData.id,
          )).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20
        ),
      );
  }

}