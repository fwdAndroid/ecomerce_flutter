import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart();

//Defining Getters
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return "You Have Free Delivery";
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  List<Product> products = [
    Product(
        name: "Soft Drink #1",
        category: "Soft Drink",
        imgUrl:
            "https://www.investopedia.com/thmb/XQ6i6akaCSLv6Bpj4yX06oZM7_Q=/3500x2263/filters:fill(auto,1)/international-green-week-agricultural-trade-fair-461626100-f4460c91031e4823a247304431530c9a.jpg",
        price: 20.00,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Soft Drink #2",
        category: "Soft Drink",
        imgUrl:
            "https://www.investopedia.com/thmb/XQ6i6akaCSLv6Bpj4yX06oZM7_Q=/3500x2263/filters:fill(auto,1)/international-green-week-agricultural-trade-fair-461626100-f4460c91031e4823a247304431530c9a.jpg",
        price: 10.00,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Smoothies # 1",
        category: "Smoothies",
        imgUrl:
            "https://marquemedical.com/wp-content/uploads/2017/10/61783418_l.jpg",
        price: 10.00,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Smoothies # 2",
        category: "Smoothies",
        imgUrl:
            "https://marquemedical.com/wp-content/uploads/2017/10/61783418_l.jpg",
        price: 4.00,
        isRecommended: true,
        isPopular: false),
    Product(
        name: "Water # 1",
        category: "Water",
        imgUrl:
            "https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/b8a1309a-ba53-48c7-bca3-9c36aab2338a.jpg",
        price: 4.00,
        isRecommended: false,
        isPopular: true),
    Product(
        name: "Water # 2",
        category: "Water",
        imgUrl:
            "https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/b8a1309a-ba53-48c7-bca3-9c36aab2338a.jpg",
        price: 4.00,
        isRecommended: true,
        isPopular: false)
  ];

  @override
  List<Object?> get props => [];
}
