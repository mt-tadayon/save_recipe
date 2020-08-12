import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/screen/category_screen.dart';
import 'package:saverecipe/screen/dashboard/add_category_card.dart';
import 'package:saverecipe/screen/dashboard/category_delete_dialog.dart';
import 'package:saverecipe/widgets/wave_border_card.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200),
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              if (index == appProvider.categories.length) {
                return AddCategoryCard();
              }

              CategoryModel category = appProvider.categories[index];
              return GestureDetector(
                onLongPress: () {
                  return showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return CategoryDeleteDialog(
                        categoryModel: category,
                      );
                    },
                  );
                },
                child: WaveBorderCard(
                  recipeCardName: category.name,
                  width: 200,
                  imageFile: category.file != null ? category.file : null,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animationOne, animationTwo) =>
                          CategoryScreen(
                        category: category,
                      ),
                      transitionsBuilder:
                          (context, animationOne, animationTwo, child) {
                        var begin = 0.0;
                        var end = 1.0;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end).chain(
                          CurveTween(curve: curve),
                        );

                        return FadeTransition(
                          opacity: animationOne.drive(tween),
                          child: child,
                        );
                      },
                      transitionDuration: Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20.0),
            itemCount: appProvider.categories.length + 1,
            scrollDirection: Axis.horizontal,
          );
        },
      ),
    );
  }
}
