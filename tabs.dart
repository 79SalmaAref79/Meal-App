
import 'package:flutter/material.dart';
import 'main_drawer.dart';
import 'categories.dart';
import 'favorites.dart';
import 'meal.dart';
class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;
  Tabs(this.favoriteMeals);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
    List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState(){
    _pages=[
      {'page': Categories(),'title':'Categories'},
      {'page':Favorites(widget.favoriteMeals),'title':'Your Favorite'},
    // widget must be use inside initState or build
    ];
    super.initState();
  }
  void _selectPage(int index){
setState(() {
  _selectedPageIndex=index;
});
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'],style: TextStyle(
            color: Colors.brown,
          ),),

        ),
      drawer: MainDrawer(),
        body:  _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        /*the biggest difference compared to the tabs at the top appBar. For
         the bottom navigation bar,
        you manually have to control what the user selected and which content you want to display.*/
         onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColorDark,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('Categories'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Favorites'),
        ),
      ],),
      );
  }
}
/*
*  /* bottom: TabBar(
            labelColor: Theme.of(context).accentColor,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category,
                  color: Colors.purple,),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star,
                  color: Colors.purple,),
                text: 'Favorites',
              ),
            ],
          ),*/
        ),
        body: TabBarView(
          children: <Widget>[
            Categories(),
            Favorites(),
          ],
        ),*/