import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/add_category_provider.dart';
import 'package:saverecipe/widgets/custom_app_bar.dart';
import 'package:saverecipe/widgets/image_picker_widget.dart';
import 'package:saverecipe/widgets/recipe_form_field.dart';
import 'package:saverecipe/widgets/submit_button_widget.dart';

class AddCategoryScreen extends StatelessWidget {
  final categoryNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RecipeFormField(
                        categoryNameController: categoryNameController),
                    SizedBox(height: 20),
                    Consumer<AddCategoryProvider>(
                      builder: (_, provider, __) {
                        return ImagePickerWidget(
                          onPressed: () async {
                            provider.selectImage();
                          },
                          image: provider.image,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Builder(
                      builder: (context) => SubmitButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            bool savedSuccessful =
                                await Provider.of<AddCategoryProvider>(context,
                                        listen: false)
                                    .saveCategory(
                              context,
                              categoryNameController.text,
                            );

                            if (savedSuccessful) {
                              Navigator.pop(context);
                            } else {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(Icons.error_outline),
                                      SizedBox(width: 10.0),
                                      Text("This category exists already"),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
