part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent {}

class InitialFetchEvent extends MainPageEvent {}

class MainPageNavigateToModelCreatPageButtonClickedEvent
    extends MainPageEvent {}
