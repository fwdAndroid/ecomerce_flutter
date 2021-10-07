import 'dart:async';
import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/respositories/product_repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;
  StreamSubscription? streamSubscription;
  ProductBloc({required ProductRepo productRepo})
      : _productRepo = productRepo,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProduct) {
      yield* _mapToLoadCategoriesToState();
    }
    if (event is UpdateProduct) {
      yield* _mapToUpdateCategoriesToState(event);
    }
  }

  Stream<ProductState> _mapToLoadCategoriesToState() async* {
    streamSubscription?.cancel();
    streamSubscription = _productRepo
        .getAllProducts()
        .listen((event) => add(UpdateProduct(event)));
  }

  Stream<ProductState> _mapToUpdateCategoriesToState(
      UpdateProduct event) async* {
    yield ProductLoaded(product: event.product);
  }
}
