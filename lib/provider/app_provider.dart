import 'package:flutter/foundation.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/repository/category_repo.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class AppProvider extends ChangeNotifier {
  CategoryRepo _repo = CategoryRepo();

  AppProvider() {
    initCategories();
  }

  List<CategoryModel> _categories = [];

  void addCategory(CategoryModel newCategory) {
    newCategory.id = uuid.v4();
    _categories.add(newCategory);
    _repo.saveCategory(newCategory);
    _sortCategoriesByName();
    notifyListeners();
  }

  void initCategories() async {
    _categories = await CategoryRepo().readCategories();
    _sortCategoriesByName();
    notifyListeners();
  }

  void _sortCategoriesByName() {
    _categories.sort(
      (current, next) => current.name.toUpperCase().compareTo(
            next.name.toUpperCase(),
          ),
    );
  }

  void deleteCategory(CategoryModel categoryModel) {
    _categories.remove(categoryModel);
    _repo.deleteCategory(categoryModel.id);
    notifyListeners();
  }

  List<CategoryModel> get categories => _categories;
}
