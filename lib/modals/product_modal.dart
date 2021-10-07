import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name, category, imgUrl;
  final double price;
  final bool isRecommended, isPopular;

  Product(
      {required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [name, category, imgUrl, price, isRecommended, isPopular];

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
        name: snapshot['name'],
        category: snapshot['category'],
        imgUrl: snapshot['img_url'],
        price: snapshot['price'],
        isRecommended: snapshot['isRecommended'],
        isPopular: snapshot['isPopular']);

    return product;
  }

  static List<Product> products = [
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
}
