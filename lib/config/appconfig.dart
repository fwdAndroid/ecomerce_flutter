import 'package:ecommerce_flutter/modals/category_modals.dart';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/screens/cart/cart_screen.dart';
import 'package:ecommerce_flutter/screens/category/catalog_screen.dart';
import 'package:ecommerce_flutter/screens/home.dart';
import 'package:ecommerce_flutter/screens/product/product_screen.dart';
import 'package:ecommerce_flutter/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MyHomePage.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ));
  }
}
