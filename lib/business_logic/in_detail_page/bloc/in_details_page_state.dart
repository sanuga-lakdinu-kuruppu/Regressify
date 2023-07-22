part of 'in_details_page_bloc.dart';

@immutable
abstract class InDetailsPageState {}

abstract class InDetailsPageActionState extends InDetailsPageState {}

class InDetailsPageInitial extends InDetailsPageState {}

class LoadingSuccessState extends InDetailsPageState {}
