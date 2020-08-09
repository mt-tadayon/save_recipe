import 'package:flutter/material.dart';
import 'package:saverecipe/screen/category_screen.dart';
import 'package:saverecipe/screen/dashboard/dashboard_screen.dart';
import 'package:saverecipe/widgets/responsive_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: DashboardScreen(),
      mediumScreen: DashboardScreen(),
      largeScreen: Row(
        children: [
          Expanded(child: DashboardScreen()),
          VerticalDivider(
            color: Colors.grey.shade700,
            thickness: 2.0,
            width: 2.0,
          ),
          Expanded(child: CategoryScreen(category: null)),
        ],
      ),
    );
  }
}
