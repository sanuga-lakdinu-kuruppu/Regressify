part of 'main_page_bloc.dart';

@immutable
abstract class MainPageState {}

abstract class MainPageActionState extends MainPageState {}

class MainPageInitial extends MainPageState {}

class LoadingState extends MainPageState {}

class LoadingSucessState extends MainPageState {}

class NavigateToCreateModelPageActionState extends MainPageActionState {}
