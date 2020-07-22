import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/provider/add_category_provider.dart';
import 'package:saverecipe/widgets/custom_app_bar.dart';
import 'package:saverecipe/widgets/image_picker_widget.dart';
import 'package:saverecipe/widgets/submit_button_widget.dart';

class AddCategoryScreen extends StatelessWidget {
  final categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_add_category.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(children: [
          CustomAppBar(
            title: "Add Category",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: kBorderColor),
                    ),
                    child: TextFormField(
                      controller: categoryNameController,
                      decoration:
                          InputDecoration.collapsed(hintText: "Category name"),
                    ),
                  ),
                  SizedBox(height: 20),
                  ImagePickerWidget(),
                  SizedBox(height: 20),
                  SubmitButton(
                    onPressed: () async {
                      bool savedSuccessful =
                          await Provider.of<AddCategoryProvider>(
                        context,
                        listen: false,
                      ).saveCategory(
                        context,
                        categoryNameController.text,
                      );

                      if (savedSuccessful) {
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
