import 'dart:io';

import 'package:flutter/foundation.dart' show ChangeNotifier;

class AddRecipeProvider extends ChangeNotifier {
  String _dropdownValue;
  File _image;
  bool _isImageErrorVisible = false;
  String _recipeName;

  Future<bool> saveRecipe() async {
    // TODO: Save to hive db

    // TODO: Create a recipe model
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

  String get dropdownValue => _dropdownValue;

  File get image => _image;

  bool get isImageErrorVisible => _isImageErrorVisible;

  String get recipeName => _recipeName;
}
