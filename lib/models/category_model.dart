import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel {

  @HiveField(0)
  String name;
  @HiveField(1)
  String imageUrl;
  @HiveField(2)
  String id;

  CategoryModel(this.name, {this.imageUrl, this.id});

  @override
  bool operator ==(other) {
    if(other is CategoryModel) {
      return this.name == other.name;
    }
    return false;
  }
}
