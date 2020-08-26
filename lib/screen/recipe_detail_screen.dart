import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saverecipe/models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipe;
  final int appBarColor;

  const RecipeDetailScreen({Key key, this.recipe, this.appBarColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: Color(appBarColor ?? 0xFF123456),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              //TODO: Save heart in Hive and change the icon in this screen and in the card
            },
          )
        ],
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Image.memory(recipe.image),
      ),
    );
  }
}
