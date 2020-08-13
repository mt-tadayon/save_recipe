import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/utils/responsive_layout.dart';
import 'package:saverecipe/widgets/lazy_network_image.dart';

class WaveBorderCard extends StatelessWidget {
  final String recipeCardName;
  final String imageUrl;
  final double width;
  final Uint8List imageFile;
  final String categoryId;

  const WaveBorderCard(
      {Key key,
      this.recipeCardName = "",
      this.width = 350,
      this.imageUrl = kImageUrlRecipeOfDay,
      this.imageFile, this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMobileScreen = ResponsiveLayout.isSmallScreen(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 200.0,
          margin: EdgeInsets.only(bottom: 8.0),
          width: width,
          child: ClipRRect(
            borderRadius: kWaveBorderRadius,
            child: Hero(
              tag: "category_image_${categoryId}",
              child: LazyNetworkImage(
                imageUrl: imageUrl,
                imageFile: imageFile,
              ),
            ),
          ),
          decoration: kWaveBoxDecoration,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: isMobileScreen ? 10 : 30),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: isMobileScreen ? 10.0 : 20.0),
            height: isMobileScreen ? 40 : 200,
            width: width - 20,
            decoration: BoxDecoration(
              color: const Color(0xCCFFFFFF),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Hero(
              tag: recipeCardName,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  recipeCardName,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
