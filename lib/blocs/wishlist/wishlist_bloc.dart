import 'dart:async';

import 'package:ecommerce_flutter/modals/product_modal.dart';
import 'package:ecommerce_flutter/modals/wishlist_modal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapStatWishlistToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishlistProductToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }

  Stream<WishlistState> _mapStatWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishlistProductToState(
      AddWishlistProduct event, WishlistState state) async* {
    try {
      if (state is WishlistLoaded) {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      }
    } catch (_) {}
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
      RemoveWishlistProduct event, WishlistState state) async* {
    try {
      if (state is WishlistLoaded) {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      }
    } catch (_) {}
  }
}
