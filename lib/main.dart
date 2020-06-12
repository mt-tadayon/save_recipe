import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/screen/dashboard_screen.dart';
import 'package:saverecipe/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme().light,
      home: ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: DashboardScreen(),
      ),
    );
  }
}
