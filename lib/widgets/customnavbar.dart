import 'package:ecommerce_flutter/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavbar extends StatelessWidget {
  final String screen;
  final Product? product;
  const CustomNavbar({
    required this.screen,
    this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.black,
        height: 70,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _selectedNavBar(context, screen)!),
      ),
    );
  }

  List<Widget>? _selectedNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoTOCheckoutNavBar(context);
      case '/checkout':
        return _buildGoTOOrderNavBar(context);
      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        // ignore: prefer_const_constructors
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        icon: const Icon(Icons.check_outlined, color: Colors.white),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/user");
        },
        icon: const Icon(Icons.person, color: Colors.white),
      ),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.share, color: Colors.white),
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WishlistLoaded) {
            return IconButton(
              onPressed: () {
                context.read<WishlistBloc>().add(AddWishlistProduct(product));
              },
              icon: const Icon(Icons.favorite, color: Colors.white),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
      BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CartLoaded) {
          return IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          );
        } else {
          return const Text('Error');
        }
      }),
    ];
  }

  List<Widget> _buildGoTOCheckoutNavBar(context) {
    return [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          child: Text(
            'Go To CheckOut',
            style: Theme.of(context).textTheme.headline2,
          ))
    ];
  }

  List<Widget> _buildGoTOOrderNavBar(context) {
    return [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () {
            //Navigator.pushNamed(context, '/checkout');
          },
          child: Text(
            'Order Now',
            style: Theme.of(context).textTheme.headline2,
          ))
    ];
  }
}
