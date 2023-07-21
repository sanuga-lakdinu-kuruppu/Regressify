part of 'new_model_page_bloc.dart';

@immutable
abstract class NewModelPageEvent {}

class InitialFetchEvent extends NewModelPageEvent {}

class AddToCartButtonClickedEvent extends NewModelPageEvent {}
