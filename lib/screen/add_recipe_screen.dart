import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/widgets/custom_app_bar.dart';

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

  @override
  void initState() {
    dropdownValue =
        Provider.of<AppProvider>(context, listen: false).categories[0].name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: MediaQuery.of(context).size.height * 0.8,
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
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Recipe Name'),
                        ),
                        Consumer<AppProvider>(
                            builder: (context, appProvider, child) {
                          return DropdownButtonFormField(
                            value: dropdownValue,
                            items: appProvider.categories
                                .map(
                                  (category) => DropdownMenuItem<String>(
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
                        _image == null
                            ? IconButton(
                                icon: Icon(
                                  Icons.camera_enhance,
                                  size: 32.0,
                                ),
                                onPressed: () async {
                                  _image = await ImagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {});
                                },
                              )
                            : Image.file(_image),
                        FlatButton(
                          color: Colors.pink,
                          child: Text('Submit'),
                          onPressed: () {},
                        )
                      ],
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
