import 'package:flutter/material.dart';
import 'main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
   final Function savefilters;
   final Map<String,bool> currentFilters;
   Filters(this.currentFilters,this.savefilters);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var vegan = false;
  var vegetarian = false;
  var lactoseFree = false;
  @override
  initState(){
    lactoseFree=widget.currentFilters['lactose'];
    _glutenFree=widget.currentFilters['gluten'];
    vegan=widget.currentFilters['vegan'];
    vegetarian=widget.currentFilters['vegetarian'];
    super.initState();
  }
  Widget _buildSwitchListTile(
    String title,
    String descreption,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(descreption),
      onChanged:updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),

      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed:(){
            final selectedFilters={
              'gluten':_glutenFree,
              'lactose':lactoseFree,
              'vegan':vegan,
              'vegetarian':vegetarian ,
            };
            widget.savefilters(selectedFilters);},
        ),
      ],),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection. ',
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-Free',
                    'Only include Gluten-free meals',
                    _glutenFree,
                    (newValue){
                  setState(() {
                    _glutenFree=newValue;
                  });
                    }),
                _buildSwitchListTile('Lactose-Free',
                    'Only include Lactose-free meals',
                    lactoseFree,
                        (newValue){
                      setState(() {
                        lactoseFree=newValue;
                      });
                    }),
                _buildSwitchListTile('Vegetarian',
                    'Only include Vegetarian meals',
                    vegetarian,
                        (newValue){
                      setState(() {
                        vegetarian=newValue;
                      });
                    }),
                _buildSwitchListTile('vegan-Free',
                    'Only include Vegan meals',
                    vegan,
                        (newValue){
                      setState(() {
                        vegan=newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
