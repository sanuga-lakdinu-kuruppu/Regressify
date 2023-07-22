part of 'new_model_page_bloc.dart';

@immutable
abstract class NewModelClassPageState {}

abstract class NewModelPageActionState extends NewModelClassPageState {}

class NewModelPageInitial extends NewModelClassPageState {}

class NewModelPageLoadingState extends NewModelClassPageState {}

class NewModelPageLoadingSucessState extends NewModelClassPageState {
  final List<DataPoints> dataPoints;

  NewModelPageLoadingSucessState({required this.dataPoints});
}

class NewModelPageLoadingErrorState extends NewModelClassPageState {}

class AddToListSuccessState extends NewModelPageActionState {}

class AddToListErrorState extends NewModelClassPageState {}

class NavigateToInDetailsPageSucessActionState
    extends NewModelPageActionState {}

class NavigateToInDetailsPageErrorActionState extends NewModelPageActionState {}
