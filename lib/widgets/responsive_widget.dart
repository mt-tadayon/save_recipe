import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget smallScreen;
  final Widget mediumScreen;
  final Widget largeScreen;

  const ResponsiveWidget(
      {Key key, this.smallScreen, this.mediumScreen, this.largeScreen})
      : super(key: key);

  static bool isSmallScreen(context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1280;
  }

  static bool isLargeScreen(context) {
    return MediaQuery.of(context).size.width >= 1280;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800) return smallScreen ?? largeScreen;
        if (constraints.maxWidth > 800 && constraints.maxWidth < 1280)
          return mediumScreen ?? largeScreen;
        return largeScreen;
      },
    );
  }
}
