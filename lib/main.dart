// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_flutter/config/appconfig.dart';
import 'package:ecommerce_flutter/config/theme.dart';
import 'package:ecommerce_flutter/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MyHomePage.routeName,
        title: 'Ecomerce Flutter',
        theme: theme(),
        home: MyHomePage());
  }
}
