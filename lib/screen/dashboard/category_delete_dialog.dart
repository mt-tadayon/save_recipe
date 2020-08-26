import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/provider/app_provider.dart';

class CategoryDeleteDialog extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryDeleteDialog({Key key, @required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      title: Text('Delete Category'),
      content: SingleChildScrollView(
        child: (ListBody(
          children: <Widget>[
            Text('You can delete this category'),
            Text('To delete this category click on delete button'),
          ],
        )),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text('Delete'),
          onPressed: () {
            // TODO: Be sure to delete all recipes in this category
            Provider.of<AppProvider>(context, listen: false)
                .deleteCategory(categoryModel);
            Navigator.pop(context);
          },
          color: const Color(0xffff0000),
        ),
      ],
    );
  }
}
