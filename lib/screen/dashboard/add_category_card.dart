import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/constant.dart';
import 'package:saverecipe/provider/add_category_provider.dart';
import 'package:saverecipe/screen/add_category_screen.dart';

class AddCategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => AddCategoryProvider(),
              child: AddCategoryScreen(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.0, bottom: 8.0),
        child: Icon(
          Icons.add_circle,
          size: 60,
          color: const Color(0xFF000000),
        ),
        decoration: kWaveBoxDecoration.copyWith(
          color: Color(0xffe0e0e0),
        ),
        width: 200,
      ),
    );
  }
}
