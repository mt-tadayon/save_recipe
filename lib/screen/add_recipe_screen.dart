import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/app_provider.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Add Recipe',
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Recipe Name'),
                ),
                Consumer<AppProvider>(builder: (context, appProvider, child) {
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
          ),
        ),
      ),
    );
  }
}
