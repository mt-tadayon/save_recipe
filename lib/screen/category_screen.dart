import 'package:flutter/material.dart';
import 'package:saverecipe/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;

  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Column(
        children: [
          Hero(
            tag: "category_image_${category.id}",
            child: category.file != null
                ? Image.memory(category.file)
                : Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
          ),
          Hero(
            tag: this.category.name,
            child: Center(
              child: Material(
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ),
          Expanded(
            child: category.recipes != null
                ? ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: category.recipes.length,
                    itemBuilder: (context, index) {
                      return Container(
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
