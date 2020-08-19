import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/provider/app_provider.dart';

class AddCategoryProvider extends ChangeNotifier {
  File _image;

  Future<bool> saveCategory(AppProvider provider, String categoryName) async {
    List<CategoryModel> categories = provider.categories;
    Uint8List imageByteArray = _image.readAsBytesSync();
    int dominantImageColor = await _getDominantImageColor(imageByteArray);

    final CategoryModel category = CategoryModel(
      categoryName,
      file: imageByteArray,
      dominantImageColor: dominantImageColor,
    );

    if (categories.contains(category)) {
      return false;
    }
    provider.addCategory(category);
    return true;
  }

  Future<int> _getDominantImageColor(Uint8List imageByteArray) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      MemoryImage(imageByteArray),
    );
    int dominantImageColor = paletteGenerator.dominantColor.color.value;
    return dominantImageColor;
  }

  File get image => _image;

  Future<void> selectImage() async {
    _image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    notifyListeners();
  }
}
