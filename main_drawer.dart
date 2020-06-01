import 'package:flutter/material.dart';
import 'filters.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTile (String title,IconData icon,Function tabHandler){
    return ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(
        title,
        style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,

    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(height: 20,),
           buildListTile('Meals',Icons.restaurant,(){
             Navigator.of(context).pushReplacementNamed('/');}),
          //we add push_replacement to clear the stack and make the perfrmance better
          buildListTile('Filters',Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          }),
        ],
      ),
    );
  }
}
