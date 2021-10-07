import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/modals/category_modals.dart';
import 'package:ecommerce_flutter/respositories/category_repo/base_category_repo.dart';

class CategoryRepo extends BaseCategoryRepo {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categoriese')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => Category.fromSnapshot(e)).toList();
    });
  }
}
