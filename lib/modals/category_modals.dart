import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgUrl;

  const Category({required this.name, required this.imgUrl});

  @override
  List<Object?> get props => [name, imgUrl];

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category =
        Category(name: snapshot['name'], imgUrl: snapshot['img_url']);

    return category;
  }

  static List<Category> categories = [
    const Category(
        name: "Soft Drink",
        imgUrl:
            "https://www.investopedia.com/thmb/XQ6i6akaCSLv6Bpj4yX06oZM7_Q=/3500x2263/filters:fill(auto,1)/international-green-week-agricultural-trade-fair-461626100-f4460c91031e4823a247304431530c9a.jpg"),
    const Category(
        name: "Smoothies",
        imgUrl:
            "https://marquemedical.com/wp-content/uploads/2017/10/61783418_l.jpg"),
    const Category(
        name: "Water",
        imgUrl:
            "https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/b8a1309a-ba53-48c7-bca3-9c36aab2338a.jpg")
  ];
}
