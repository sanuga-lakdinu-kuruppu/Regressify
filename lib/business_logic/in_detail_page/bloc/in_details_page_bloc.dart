import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'in_details_page_event.dart';
part 'in_details_page_state.dart';

class InDetailsPageBloc extends Bloc<InDetailsPageEvent, InDetailsPageState> {
  InDetailsPageBloc() : super(InDetailsPageInitial()) {
    on<InDetailsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
