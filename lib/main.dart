import 'app/app_route.dart';
import 'styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spotipi',
      debugShowCheckedModeBanner: false,
      theme: themeApp(),
      getPages: pagesRoutes,
    );
  }
}

