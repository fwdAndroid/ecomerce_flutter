import 'package:ecommerce_flutter/screens/cart/cart_screen.dart';
import 'package:ecommerce_flutter/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MyHomePage.route();
      case CartScreen.routeName:
        return CartScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        // ignore: prefer_const_constructors
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ));
  }
}
