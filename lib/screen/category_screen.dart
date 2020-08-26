import 'package:flutter/material.dart';
import 'package:saverecipe/models/category_model.dart';

import 'recipe_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;

  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    var imageHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: Color(category.dominantImageColor ?? 0xFF123456),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "category_image_${category.id}",
            child: Image(
              image: category.file != null
                  ? MemoryImage(category.file)
                  : NetworkImage(category.imageUrl),
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              category.name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: category.recipes != null
                ? ListView.builder(
                    itemCount: category.recipes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              category.recipes[index].name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                              size: 27,
                              color: Color(0xff000000),
                            ),
                            leading: Icon(
                              Icons.favorite_border,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RecipeDetailScreen(
                                    recipe: category.recipes[index],
                                    appBarColor: category.dominantImageColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}

/*
Container(
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
Container(
height: 80,
width: 80,
decoration: BoxDecoration(
shape: BoxShape.circle,
image: DecorationImage(
image: MemoryImage(
category.recipes[index].image),
fit: BoxFit.fill),
),
),
Text(
category.recipes[index].name,
style: TextStyle(fontSize: 24),
),
],
),
);*/
