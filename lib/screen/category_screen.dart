import 'package:flutter/material.dart';
import 'package:saverecipe/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;

  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Hero(
              tag: this.category.name,
              child: Center(
                child: Material(
                  child: Text(
                    this.category.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
          ),
          Text('${category.recipes[0].name}')
        ],
      ),
    );
  }
}
