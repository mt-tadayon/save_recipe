import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/provider/app_provider.dart';

class AddCategoryProvider extends ChangeNotifier {
  File _image;

  Future<bool> saveCategory(BuildContext context, String categoryName) async {
    List<CategoryModel> categories =
        Provider.of<AppProvider>(context, listen: false).categories;
    Uint8List imageByteArray = _image.readAsBytesSync();
    var category = CategoryModel(categoryName, file: imageByteArray);
    print(imageByteArray);
    if (categories.contains(category)) {
      return false;
    }
    Provider.of<AppProvider>(context, listen: false).addCategory(category);
    return true;
  }

  File get image => _image;

  Future<void> selectImage() async {
    _image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    notifyListeners();
  }
}
