import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:saverecipe/models/category_model.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Color dominantColor = Colors.blue;
  Future<void> getDominantColor() async {
    MemoryImage image = MemoryImage(widget.category.file);
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(image);
    dominantColor = paletteGenerator.dominantColor.color;
    setState(() {});
  }

  @override
  void initState() {
    getDominantColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: dominantColor,
      ),
      body: Column(
        children: [
          Hero(
            tag: "category_image_${widget.category.id}",
            child: widget.category.file != null
                ? Image.memory(widget.category.file)
                : Image.network(
                    widget.category.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
          ),
          Center(
            child: Material(
              child: Text(
                widget.category.name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Expanded(
            child: widget.category.recipes != null
                ? ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: widget.category.recipes.length,
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
                                        widget.category.recipes[index].image),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              widget.category.recipes[index].name,
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
