part of 'new_model_page_bloc.dart';

@immutable
abstract class NewModelClassPageState {}

abstract class NewModelPageActionState extends NewModelClassPageState {}

class NewModelPageInitial extends NewModelClassPageState {}

class NewModelPageLoadingState extends NewModelClassPageState {}

class NewModelPageLoadingSucessState extends NewModelClassPageState {}

class NewModelPageLoadingErrorState extends NewModelClassPageState {}

class AddToListSuccessState extends NewModelClassPageState {}

class AddToListErrorState extends NewModelClassPageState {}
