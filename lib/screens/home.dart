// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/modals/category_modals.dart';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/widgets/customappbar.dart';
import 'package:ecommerce_flutter/widgets/customnavbar.dart';
import 'package:ecommerce_flutter/widgets/hero_coursal_slider.dart';
import 'package:ecommerce_flutter/widgets/product_card_slider.dart';
import 'package:ecommerce_flutter/widgets/product_carousel.dart';
import 'package:ecommerce_flutter/widgets/sectiontitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Zero To Unicorn',
      ),
      bottomNavigationBar: CustomNavbar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height),
            items: Category.categories
                .map((category) => HeroCoursel(category: category))
                .toList(),
          ),
          //Title Section
          SectionTitle(title: "RECOMMENDED"),
          //Show Products in Coursel Slider List For
          ProductCarousel(
              products: Product.products
                  .where((element) => element.isRecommended)
                  .toList())
        ],
      ),
    );
  }
}
