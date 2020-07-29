import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/provider/app_provider.dart';

class AddCategoryProvider extends ChangeNotifier {
  File _image;

  Future<bool> saveCategory(BuildContext context, String categoryName) async {
    List<CategoryModel> categories =
        Provider.of<AppProvider>(context, listen: false).categories;
    var category = CategoryModel(categoryName);
    if (categories.contains(category)) {
      return false;
    }
    Provider.of<AppProvider>(context, listen: false).addCategory(category);
    return true;
  }

  File get image => _image;
}
