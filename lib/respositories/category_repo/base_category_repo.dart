//Abstract class

import 'package:ecommerce_flutter/modals/category_modals.dart';

abstract class BaseCategoryRepo {
  Stream<List<Category>> getAllCategories();
}
