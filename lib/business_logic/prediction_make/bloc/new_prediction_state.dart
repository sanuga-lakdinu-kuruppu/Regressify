part of 'new_prediction_bloc.dart';

@immutable
abstract class NewPredictionState {}

class NewPredictionInitial extends NewPredictionState {}

class PredictedSuccessState extends NewPredictionState {
  final double prediction;

  PredictedSuccessState({required this.prediction});
}

class PredictionLoadingSucessState extends NewPredictionState {}
