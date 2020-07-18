import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/app_provider.dart';
import 'package:saverecipe/repository/hive_db.dart';
import 'package:saverecipe/screen/main_screen.dart';
import 'package:saverecipe/theme.dart';

void main() async {
  await HiveDb().initHive();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.of(context).locale,
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        theme: CustomTheme().light,
        home: MainScreen(),
      ),
    );
  }
}
