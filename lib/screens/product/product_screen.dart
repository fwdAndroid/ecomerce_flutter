import 'package:ecommerce_flutter/widgets/customappbar.dart';
import 'package:ecommerce_flutter/widgets/customnavbar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product List',
      ),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
