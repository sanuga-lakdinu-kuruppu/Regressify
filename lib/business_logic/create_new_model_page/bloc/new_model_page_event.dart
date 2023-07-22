part of 'new_model_page_bloc.dart';

@immutable
abstract class NewModelPageEvent {}

class InitialFetchEvent extends NewModelPageEvent {}

class AddToListButtonClickedEvent extends NewModelPageEvent {
  final DataPoints dataPoints;

  AddToListButtonClickedEvent({required this.dataPoints});
}

class TrainTheModelButtonClickedEvent extends NewModelPageEvent {}
