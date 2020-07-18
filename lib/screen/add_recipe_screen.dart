import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/widgets/custom_app_bar.dart';
import 'package:saverecipe/widgets/image_picker_widget.dart';
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
  String dropdownValue;
  File _image;
  bool isImageErrorVisible = false;

  @override
  void initState() {
    dropdownValue =
        Provider.of<AppProvider>(context, listen: false).categories[0].name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                Container(
                                  child: TextFormField(
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Recipe Name',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please provide a recipe name';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: kBorderColor),
                                  ),
                                  height: 50,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 20),
                                ),
                                SizedBox(height: 20),
                                Consumer<AppProvider>(
                                    builder: (context, appProvider, child) {
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
                                    value: dropdownValue,
                                    items: appProvider.categories
                                        .map(
                                          (category) =>
                                              DropdownMenuItem<String>(
                                            value: category.name,
                                            child: Text(category.name),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (selectedCategoryName) {
                                      setState(() {
                                        dropdownValue = selectedCategoryName;
                                      });
                                    },
                                  );
                                }),
                                SizedBox(height: 20),
                                ImagePickerWidget()
                              ],
                            ),
                            SizedBox(height: 20),
                            SubmitButton(
                              onPressed: () {
                                isImageErrorVisible = _image == null;
                                setState(() {});
                                if (_formKey.currentState.validate() &&
                                    !isImageErrorVisible) {
                                  //TODO: save data on db
                                  Navigator.pop(context);
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
