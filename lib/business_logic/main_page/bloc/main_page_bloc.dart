import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<InitialFetchEvent>(initialFetchEvent);
    on<MainPageNavigateToModelCreatPageButtonClickedEvent>(
        mainPageNavigateToModelCreatPageButtonClickedEvent);
  }

  FutureOr<void> initialFetchEvent(
      InitialFetchEvent event, Emitter<MainPageState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoadingSucessState());
  }

  FutureOr<void> mainPageNavigateToModelCreatPageButtonClickedEvent(
      MainPageNavigateToModelCreatPageButtonClickedEvent event,
      Emitter<MainPageState> emit) {
    emit(NavigateToCreateModelPageActionState());
  }
}
