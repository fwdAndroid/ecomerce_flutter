import 'package:ecommerce_flutter/widgets/customappbar.dart';
import 'package:ecommerce_flutter/widgets/customnavbar.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wish';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'WishList',
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
