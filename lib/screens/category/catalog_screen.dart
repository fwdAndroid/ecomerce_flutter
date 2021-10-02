import 'package:ecommerce_flutter/modals/category_modals.dart';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/widgets/customappbar.dart';
import 'package:ecommerce_flutter/widgets/customnavbar.dart';
import 'package:ecommerce_flutter/widgets/product_card_slider.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  //Constructor
  final Category category;
  CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProductsList = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15),
        itemCount: categoryProductsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: ProductCard(
            product: categoryProductsList[index],
            widthFactor: 2.2,
          ));
        },
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
