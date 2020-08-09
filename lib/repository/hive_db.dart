import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/models/recipe_model.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/repository/category_repo.dart';

class HiveDb {
  Future initHive() async {
    await Hive.initFlutter();
    await Hive.registerAdapter(
      CategoryModelAdapter(),
    );
    await Hive.registerAdapter(
      RecipeModelAdapter(),
    );
    initTestData();
  }

  void initTestData() async {
    final List<CategoryModel> _categories = [
      CategoryModel(
        "Noodles",
        imageUrl: kImageUrlRecipeOfDay,
      ),
      CategoryModel('Rice', imageUrl: kImageUrlRecipeOfDay),
      CategoryModel('Chicken', imageUrl: kImageUrlRecipeOfDay),
      CategoryModel('Beef', imageUrl: kImageUrlRecipeOfDay),
      CategoryModel('Veggie', imageUrl: kImageUrlRecipeOfDay)
    ];

    CategoryRepo _repo = CategoryRepo();

    var categories = await _repo.readCategories();
    if (categories.isEmpty)
      _categories.forEach((element) {
        element.id = uuid.v4();
        _repo.saveCategory(element);
      });
  }
}
