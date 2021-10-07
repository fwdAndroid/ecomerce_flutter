// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/blocs/category/category_bloc.dart';
import 'package:ecommerce_flutter/blocs/product/product_bloc.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

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
      bottomNavigationBar: CustomNavbar(
        screen: routeName,
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryLoading) {
              return CircularProgressIndicator();
            }

            if (state is CategoryLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
                items: state.categories
                    .map((category) => HeroCoursel(category: category))
                    .toList(),
              );
            } else {
              return Text('Error');
            }
          }),
          //Title Section
          SectionTitle(title: "RECOMMENDED"),
          //Show Products in Coursel Slider List For
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return CircularProgressIndicator();
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.product
                        .where((element) => element.isRecommended)
                        .toList());
              } else {
                return Text('Error');
              }
            },
          ),
          SectionTitle(title: "Most Popular"),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return CircularProgressIndicator();
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.product
                        .where((element) => element.isPopular)
                        .toList());
              } else {
                return Text('Error');
              }
            },
          ),
        ],
      ),
    );
  }
}
