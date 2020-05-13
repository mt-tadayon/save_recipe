import 'package:flutter/material.dart';

class ResponsiveLayout {
  static const int kMobileWidth = 800;

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < kMobileWidth;
  }
}
