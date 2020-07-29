import 'package:flutter_test/flutter_test.dart';
import 'package:saverecipe/models/category_model.dart';

void main() {
  group("CategoryModel", () {
    CategoryModel subject;

    setUp(() {
      subject = CategoryModel("TestCategory");
    });

    test("should return true if subject is in list", () {
      List<CategoryModel> categoryModels = [CategoryModel("TestCategory")];
      expect(categoryModels.contains(subject), isTrue);
    });

    test("should return false if subject is not in list", () {
      List<CategoryModel> categoryModels = [CategoryModel("Another Name")];
      expect(categoryModels.contains(subject), isFalse);
    });
  });
}
