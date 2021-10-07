import 'package:ecommerce_flutter/modals/product_modal.dart';

abstract class BaseProductRepo {
  Stream<List<Product>> getAllProducts();
}
