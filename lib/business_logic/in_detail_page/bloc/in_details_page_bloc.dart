import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'in_details_page_event.dart';
part 'in_details_page_state.dart';

class InDetailsPageBloc extends Bloc<InDetailsPageEvent, InDetailsPageState> {
  InDetailsPageBloc() : super(InDetailsPageInitial()) {
    on<InDetailPageInitialFetchEvent>(inDetailPageInitialFetchEvent);
  }

  FutureOr<void> inDetailPageInitialFetchEvent(
      InDetailPageInitialFetchEvent event, Emitter<InDetailsPageState> emit) {
    emit(LoadingSuccessState());
  }
}
