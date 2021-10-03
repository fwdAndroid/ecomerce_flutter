import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:equatable/equatable.dart';

class WishList extends Equatable {
  final List<Product> products;
  const WishList({ this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
