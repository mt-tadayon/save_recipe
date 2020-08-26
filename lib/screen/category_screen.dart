import 'package:flutter/material.dart';
import 'package:saverecipe/models/category_model.dart';

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
          Text(
            category.name,
            style: Theme.of(context).textTheme.headline5,
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
