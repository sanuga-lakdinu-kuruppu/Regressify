part of 'new_prediction_bloc.dart';

@immutable
abstract class NewPredictionEvent {}

class PredictButtonClickedEvent extends NewPredictionEvent {
  final PredictionMakingDTO predictionDto;

  PredictButtonClickedEvent({required this.predictionDto});
}

class PredictionInitialEvent extends NewPredictionEvent {}
