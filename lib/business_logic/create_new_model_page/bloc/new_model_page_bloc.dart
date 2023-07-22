import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:regressify/data/models/data_points/data_points.dart';
import 'package:regressify/testing/test.dart';

part 'new_model_page_event.dart';
part 'new_model_page_state.dart';

class NewModelPageBloc extends Bloc<NewModelPageEvent, NewModelClassPageState> {
  NewModelPageBloc() : super(NewModelPageInitial()) {
    on<InitialFetchEvent>(initialFetchEvent);
    on<AddToListButtonClickedEvent>(addToListButtonClickedEvent);
    on<TrainTheModelButtonClickedEvent>(trainTheModelButtonClickedEvent);
  }

  FutureOr<void> initialFetchEvent(
      InitialFetchEvent event, Emitter<NewModelClassPageState> emit) {
    emit(NewModelPageLoadingState());
    emit(NewModelPageLoadingSucessState(
        dataPoints: dataPoints
            .map((e) => DataPoints(
                id: e['id'], xValue: e['xValue'], yValue: e['yValue']))
            .toList()));
  }

  FutureOr<void> addToListButtonClickedEvent(
      AddToListButtonClickedEvent event, Emitter<NewModelClassPageState> emit) {
    Map<String, dynamic> someMap = {
      'id': event.dataPoints.id + 1,
      'xValue': event.dataPoints.xValue,
      'yValue': event.dataPoints.yValue,
    };
    dataPoints.add(someMap);
    emit(NewModelPageLoadingSucessState(
        dataPoints: dataPoints
            .map((e) => DataPoints(
                id: e['id'], xValue: e['xValue'], yValue: e['yValue']))
            .toList()));
    emit(AddToListSuccessState());
  }

  FutureOr<void> trainTheModelButtonClickedEvent(
      TrainTheModelButtonClickedEvent event,
      Emitter<NewModelClassPageState> emit) {
    if (dataPoints.isNotEmpty) {
      emit(NavigateToInDetailsPageSucessActionState());
    } else {
      emit(NavigateToInDetailsPageErrorActionState());
    }
  }
}
