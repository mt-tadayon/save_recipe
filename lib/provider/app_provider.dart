import 'package:flutter/foundation.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/models/category_model.dart';

class AppProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = [
    CategoryModel("Noodles", imageUrl: kImageUrlRecipeOfDay),
    CategoryModel("Rice", imageUrl: kImageUrlRecipeOfDay),
    CategoryModel("Chicken", imageUrl: kImageUrlRecipeOfDay),
    CategoryModel("Beef", imageUrl: kImageUrlRecipeOfDay),
    CategoryModel("Veggie", imageUrl: kImageUrlRecipeOfDay)
  ];

  void addCategory(CategoryModel newCategory) {
    _categories.add(newCategory);
    notifyListeners();
  }

  List<CategoryModel> get categories => _categories;
}
