import 'dart:io';

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:saverecipe/models/category_model.dart';

class AddRecipeProvider extends ChangeNotifier {
  // TODO: Init somehow our selectedCategory
  CategoryModel _selectedCategory;
  File _image;
  bool _isImageErrorVisible = false;
  String _recipeName;

  Future<bool> saveRecipe() async {
    // TODO: Save to hive db

    // TODO: Receive the selected category where the recipe has to be saved
    // TODO: After that we have to update the category
    return false;
  }

  void set setRecipeName(String recipeName) => _recipeName = recipeName;

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  void checkImageError() {
    _isImageErrorVisible = _image == null;
    notifyListeners();
  }

  CategoryModel get selectedCategory => _selectedCategory;

  File get image => _image;

  bool get isImageErrorVisible => _isImageErrorVisible;

  String get recipeName => _recipeName;

  void setSelectedCategory(CategoryModel category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
