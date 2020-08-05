import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/models/category_model.dart';
import 'package:saverecipe/provider/add_recipe_provider.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/widgets/custom_app_bar.dart';
import 'package:saverecipe/widgets/image_picker_widget.dart';
import 'package:saverecipe/widgets/recipe_form_field.dart';
import 'package:saverecipe/widgets/submit_button_widget.dart';

const kBackground = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/bg_add_recipe.png"),
    fit: BoxFit.cover,
  ),
);

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var appProvider = Provider.of<AppProvider>(context, listen: false);
    var addRecipeProvider =
        Provider.of<AddRecipeProvider>(context, listen: false);

    addRecipeProvider.setSelectedCategory(appProvider.categories[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addRecipeProvider =
        Provider.of<AddRecipeProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: kBackground,
        child: Column(
          children: [
            CustomAppBar(title: "Add Recipe"),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: kBorderColor,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(120.0),
                        ),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [kBoxShadow],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30,
                        bottom: 30,
                        top: MediaQuery.of(context).size.height * 0.15,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RecipeFormField(
                                  onSaved: (String value) {
                                    addRecipeProvider.setRecipeName = value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a recipe name';
                                    }
                                    return null;
                                  },
                                  hintText: "Recipe Name",
                                ),
                                SizedBox(height: 20),
                                Consumer2<AppProvider, AddRecipeProvider>(
                                    builder: (context, appProvider,
                                        addRecipeProvider, child) {
                                  // TODO: Check if the DropDown is still working
                                  return DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide:
                                            BorderSide(color: kBorderColor),
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      filled: true,
                                      fillColor: kWhite,
                                    ),
                                    value: addRecipeProvider.selectedCategory,
                                    items: appProvider.categories
                                        .map(
                                          (category) =>
                                              DropdownMenuItem<CategoryModel>(
                                            value: category,
                                            child: Text(category.name),
                                          ),
                                        )
                                        .toList(),
                                    onChanged:
                                        (CategoryModel selectedCategory) {
                                      addRecipeProvider.setSelectedCategory(
                                          selectedCategory);
                                    },
                                  );
                                }),
                                SizedBox(height: 20),
                                Consumer<AddRecipeProvider>(
                                  builder:
                                      (context, addRecipeProvider, child) =>
                                          ImagePickerWidget(
                                    image: addRecipeProvider.image,
                                    isImageErrorVisible:
                                        addRecipeProvider.isImageErrorVisible,
                                    onPressed: () async {
                                      // TODO: Remove Deprecation
                                      addRecipeProvider
                                          .setImage(await ImagePicker.pickImage(
                                        source: ImageSource.gallery,
                                      ));
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            SubmitButton(
                              onPressed: () async {
                                addRecipeProvider.checkImageError();
                                if (_formKey.currentState.validate() &&
                                    !addRecipeProvider.isImageErrorVisible) {
                                  _formKey.currentState.save();

                                  bool shouldNavigate =
                                      await addRecipeProvider.saveRecipe();

                                  if (shouldNavigate) Navigator.pop(context);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
