import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_model_page_event.dart';
part 'new_model_page_state.dart';

class NewModelPageBloc extends Bloc<NewModelPageEvent, NewModelClassPageState> {
  NewModelPageBloc() : super(NewModelPageInitial()) {
    on<InitialFetchEvent>(initialFetchEvent);
    on<AddToCartButtonClickedEvent>(addToCartButtonClickedEvent);
  }

  FutureOr<void> initialFetchEvent(
      InitialFetchEvent event, Emitter<NewModelClassPageState> emit) {
    emit(NewModelPageLoadingState());
    emit(NewModelPageLoadingSucessState());
  }

  FutureOr<void> addToCartButtonClickedEvent(
      AddToCartButtonClickedEvent event, Emitter<NewModelClassPageState> emit) {
    print('Add to list');
    emit(AddToListSuccessState());
  }
}
