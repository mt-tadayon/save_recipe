import 'package:flutter/material.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/utils/responsive_layout.dart';
import 'package:saverecipe/widgets/lazy_network_image.dart';

const radius = BorderRadius.only(
  topLeft: Radius.circular(30.0),
  bottomRight: Radius.circular(30.0),
);

class WaveBorderCard extends StatelessWidget {
  final String recipeCardName;
  final String imageUrl;
  final double width;

  const WaveBorderCard(
      {Key key,
      this.recipeCardName = "",
      this.width = 350,
      this.imageUrl = kImageUrlRecipeOfDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMobileScreen = ResponsiveLayout.isSmallScreen(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 200.0,
          width: width,
          child: ClipRRect(
            borderRadius: radius,
            child: LazyNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                color: kBoxShadowColor,
                offset: Offset(3, 3),
                blurRadius: 6.0,
              )
            ],
          ),
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
