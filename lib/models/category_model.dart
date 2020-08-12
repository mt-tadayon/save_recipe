import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:saverecipe/models/recipe_model.dart';
part 'category_model.g.dart';

// TODO: Poll said remove g files from Git Repo

@HiveType(typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String name;

  // TODO: Remove in the future
  @HiveField(1)
  String imageUrl;

  @HiveField(2)
  String id;

  @HiveField(3)
  Uint8List file;

  @HiveField(4)
  HiveList<RecipeModel> recipes;

  CategoryModel(this.name, {this.imageUrl, this.id, this.file, this.recipes});

  @override
  bool operator ==(other) {
    if (other is CategoryModel) {
      return this.name == other.name;
    }
    return false;
  }
}
