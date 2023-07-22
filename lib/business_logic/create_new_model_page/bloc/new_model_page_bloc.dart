import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:regressify/data/models/data_points/data_points.dart';
import 'package:regressify/data/models/models/created_model.dart';
import 'package:regressify/testing/test.dart';

part 'new_model_page_event.dart';
part 'new_model_page_state.dart';

class NewModelPageBloc extends Bloc<NewModelPageEvent, NewModelClassPageState> {
  late List<double> xValue = [];
  late List<double> yValue = [];
  late BuildModel buildModel;

  NewModelPageBloc() : super(NewModelPageInitial()) {
    on<InitialFetchEvent>(initialFetchEvent);
    on<AddToListButtonClickedEvent>(addToListButtonClickedEvent);
    on<TrainTheModelButtonClickedEvent>(trainTheModelButtonClickedEvent);
  }

  FutureOr<void> initialFetchEvent(
      InitialFetchEvent event, Emitter<NewModelClassPageState> emit) {
    emit(NewModelPageLoadingState());
    emit(NewModelPageLoadingSucessState(
        dataPoints: dataPoints
            .map((e) => DataPoints(
                id: e['id'], xValue: e['xValue'], yValue: e['yValue']))
            .toList()));
  }

  FutureOr<void> addToListButtonClickedEvent(
      AddToListButtonClickedEvent event, Emitter<NewModelClassPageState> emit) {
    Map<String, dynamic> someMap = {
      'id': event.dataPoints.id + 1,
      'xValue': event.dataPoints.xValue,
      'yValue': event.dataPoints.yValue,
    };
    dataPoints.add(someMap);
    xValue.add(event.dataPoints.xValue);
    yValue.add(event.dataPoints.yValue);
    emit(NewModelPageLoadingSucessState(
        dataPoints: dataPoints
            .map((e) => DataPoints(
                id: e['id'], xValue: e['xValue'], yValue: e['yValue']))
            .toList()));
    emit(AddToListSuccessState());
  }

  FutureOr<void> trainTheModelButtonClickedEvent(
      TrainTheModelButtonClickedEvent event,
      Emitter<NewModelClassPageState> emit) async {
    if (dataPoints.isNotEmpty) {
      emit(ModelTrainingState());
      trainTheModel(0, 0, 1.0e-2, 10000);
      await Future.delayed(const Duration(seconds: 3));
      emit(ModelTrainingSucessActionState(buildModel: buildModel));
    } else {
      emit(TrainingDataNotFoundActionState());
    }
  }

  void trainTheModel(
      double initW, double initB, double alphaValue, int countIterations) {
    buildModel = BuildModel(
        xTrain: xValue,
        yTrain: yValue,
        w: initW,
        b: initB,
        alpha: alphaValue,
        count: countIterations);

    buildModel.result = getFinalGradientDescentValues(
        buildModel.xTrain,
        buildModel.yTrain,
        buildModel.w,
        buildModel.b,
        buildModel.count,
        buildModel.alpha);
  }

  List<double> getGradientValues(
      List<double> x, List<double> y, double w, double b) {
    int len = x.length;
    double gradientDW = 0;
    double gradientDb = 0;

    for (int i = 0; i < len; i++) {
      var tempW = (w * x[i] + b - y[i]) * x[i];
      var tempB = w * x[i] + b - y[i];
      gradientDW += tempW;
      gradientDb += tempB;
    }
    gradientDW = gradientDW / len;
    gradientDb = gradientDb / len;
    List<double> finalList = [gradientDW, gradientDb];
    return finalList;
  }

  List<double> getFinalGradientDescentValues(List<double> x, List<double> y,
      double wIn, double bIn, int count, double alpha) {
    double w = wIn;
    double b = bIn;
    double gradientDW = 0;
    double gradientDB = 0;

    for (int i = 0; i < count; i++) {
      List<double> valueList = getGradientValues(x, y, w, b);
      gradientDW = valueList[0];
      gradientDB = valueList[1];

      w = w - alpha * gradientDW;
      b = b - alpha * gradientDB;
    }
    List<double> finalList = [w, b];
    return finalList;
  }
}
