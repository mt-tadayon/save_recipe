import 'dart:io';
import 'package:flutter/material.dart';
import 'package:saverecipe/constant.dart';

class ImagePickerWidget extends StatelessWidget {
  final File image;
  final bool isImageErrorVisible;
  final VoidCallback onPressed;

  ImagePickerWidget(
      {this.onPressed, this.image, this.isImageErrorVisible = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: kBorderColor,
        ),
        image: image != null
            ? DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              )
            : null,
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: IconButton(
              icon: Icon(
                Icons.camera,
              ),
              iconSize: 60,
              onPressed: onPressed,
            ),
          ),
          isImageErrorVisible
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please select an image',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
