import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/models/recipe_model.dart';
import 'package:saverecipe/repository/recipe_repo.dart';

class AddRecipeProvider extends ChangeNotifier {
  // TODO: Init somehow our selectedCategory
  CategoryModel _selectedCategory;
  File _image;
  bool _isImageErrorVisible = false;
  String _recipeName;
  //TODO: user dependency injection
  RecipeRepo _recipeRepo = RecipeRepo();

  Future<bool> saveRecipe() async {
    Uint8List imageByteArray = _image.readAsBytesSync();
    RecipeModel recipe = RecipeModel(_recipeName, imageByteArray);
    await _recipeRepo.saveRecipe(recipe);
    _selectedCategory.recipes =
        _selectedCategory.recipes ?? await _recipeRepo.createRecipeList();
    _selectedCategory.recipes.add(recipe);
    try {
      await _selectedCategory.save();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
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

  void setSelectedCategory(CategoryModel category) =>
      _selectedCategory = category;
}
