import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/dto/make_prediction.dart';

part 'new_prediction_event.dart';
part 'new_prediction_state.dart';

class NewPredictionBloc extends Bloc<NewPredictionEvent, NewPredictionState> {
  NewPredictionBloc() : super(NewPredictionInitial()) {
    on<PredictionInitialEvent>(predictionInitialEvent);
    on<PredictButtonClickedEvent>(predictButtonClickedEvent);
  }

  FutureOr<void> predictionInitialEvent(
      PredictionInitialEvent event, Emitter<NewPredictionState> emit) {
    emit(PredictionLoadingSucessState());
  }

  FutureOr<void> predictButtonClickedEvent(
      PredictButtonClickedEvent event, Emitter<NewPredictionState> emit) {
    double prediction = getPrediction(event.predictionDto);
    emit(PredictedSuccessState(prediction: prediction));
  }

  double getPrediction(PredictionMakingDTO predictionMakingDTO) {
    double w = predictionMakingDTO.buildModel.result![0];
    double b = predictionMakingDTO.buildModel.result![1];
    double xValue = predictionMakingDTO.xValue;
    double prediction = w * xValue + b;
    return prediction;
  }
}
