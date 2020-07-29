import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saverecipe/screen/dashboard/category_delete_dialog.dart';

main() {
  group("CategoryDeleteDialog", () {
    testWidgets("should show a widget", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CategoryDeleteDialog(
          categoryModel: null,
        ),
      ));

      expect(
        tester.firstWidget(find.text("Delete Category")),
        isA<Text>(),
        reason: "The title is not 'Delete Category'",
      );
    });
  });
}
