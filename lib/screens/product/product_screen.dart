import 'package:ecommerce_flutter/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        // ignore: prefer_const_constructors
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: product,
            ));
  }

  final Product product;
  // ignore: use_key_in_widget_constructors
  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product List',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product));

                      //Snakbar
                      final snakbar =
                          SnackBar(content: Text('Added to your Wishlist'));
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                    },
                    icon: Icon(Icons.favorite, color: Colors.white));
              }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('Add To Cart',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
