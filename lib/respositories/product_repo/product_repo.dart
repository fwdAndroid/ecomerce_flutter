import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/respositories/product_repo/base_product_repo.dart';

class ProductRepo extends BaseProductRepo {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection('products').snapshots().map((event) {
      return event.docs.map((e) => Product.fromSnapshot(e)).toList();
    });
  }
}
