import 'dart:async';

import 'package:ecommerce_flutter/modals/category_modals.dart';
import 'package:ecommerce_flutter/respositories/category_repo/category_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo _categoryRepo;
  StreamSubscription? streamSubscription;
  CategoryBloc({required CategoryRepo categoryRepo})
      : _categoryRepo = categoryRepo,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is LoadCategories) {
      yield* _mapToLoadCategoriesToState();
    }
    if (event is UpdateCategories) {
      yield* _mapToUpdateCategoriesToState(event);
    }
  }

  Stream<CategoryState> _mapToLoadCategoriesToState() async* {
    streamSubscription?.cancel();
    streamSubscription = _categoryRepo
        .getAllCategories()
        .listen((event) => add(UpdateCategories(event)));
  }

  Stream<CategoryState> _mapToUpdateCategoriesToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}
