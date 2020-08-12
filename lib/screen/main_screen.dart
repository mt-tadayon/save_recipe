import 'package:flutter/material.dart';
import 'package:saverecipe/screen/dashboard/dashboard_screen.dart';
import 'package:saverecipe/widgets/responsive_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: DashboardScreen(),
      mediumScreen: DashboardScreen(),
      largeScreen: DashboardScreen(),
    );
  }
}
