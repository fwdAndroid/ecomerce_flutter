import 'package:ecommerce_flutter/blocobserver.dart';
import 'package:ecommerce_flutter/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_flutter/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_flutter/config/appconfig.dart';
import 'package:ecommerce_flutter/config/theme.dart';
import 'package:ecommerce_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()
            ..add(
              StartWishlist(),
            ),
        ),
        BlocProvider(
          create: (_) => CartBloc()
            ..add(
              CartStarted(),
            ),
        ),
      ],
      child: MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: MyHomePage.routeName,
          title: 'Ecomerce Flutter',
          theme: theme(),
          home: MyHomePage()),
    );
  }
}
