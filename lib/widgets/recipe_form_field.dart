import 'package:flutter/material.dart';
import 'package:saverecipe/constant.dart';

class RecipeFormField extends StatelessWidget {
  const RecipeFormField({
    Key key,
    @required this.categoryNameController,
  }) : super(key: key);

  final TextEditingController categoryNameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kBorderColor),
      ),
      height: 50,
      alignment: Alignment.center,
      child: TextFormField(
        controller: categoryNameController,
        decoration: InputDecoration.collapsed(
          hintText: "Category name",
        ),
        validator: (value) {
          return value.isEmpty
              ? "Please add a category name"
              : null;
        },
      ),
    );
  }
}
