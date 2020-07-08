import 'package:flutter/foundation.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/repository/category_repo.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    initCategories();
  }

  List<CategoryModel> _categories = [];

  void addCategory(CategoryModel newCategory) {
    _categories.add(newCategory);
    notifyListeners();
  }

  void initCategories() async {
    _categories = await CategoryRepo().readCategories();
    notifyListeners();
  }

  List<CategoryModel> get categories => _categories;
}