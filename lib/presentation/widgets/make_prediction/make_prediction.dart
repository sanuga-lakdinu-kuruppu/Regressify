import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regressify/data/dto/make_prediction.dart';
import 'package:regressify/data/models/models/created_model.dart';
import '../../../business_logic/prediction_make/bloc/new_prediction_bloc.dart';

class Prediction extends StatefulWidget {
  final BuildModel buildModel;
  const Prediction({super.key, required this.buildModel});

  @override
  // ignore: no_logic_in_create_state
  State<Prediction> createState() => _PredictionState(buildModel: buildModel);
}

class _PredictionState extends State<Prediction> {
  NewPredictionBloc newPredictionBloc = NewPredictionBloc();
  final BuildModel buildModel;
  TextEditingController xValueController = TextEditingController();

  _PredictionState({required this.buildModel});
  @override
  void initState() {
    newPredictionBloc.add(PredictionInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPredictionBloc, NewPredictionState>(
      bloc: newPredictionBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case PredictionLoadingSucessState:
            xValueController.clear();
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                      blurRadius: 2,
                      color: Colors.grey)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: xValueController,
                      cursorColor: Colors.grey,
                      style: const TextStyle(color: Colors.teal),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1.0),
                          ),
                          hintText: 'feature label value (X)',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          minimumSize: const Size(double.maxFinite, 67),
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        newPredictionBloc.add(PredictButtonClickedEvent(
                            predictionDto: PredictionMakingDTO(
                                buildModel: buildModel,
                                xValue: double.parse(xValueController.text))));
                      },
                      child: const Center(
                        child: Text('Predict',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            );

          case PredictedSuccessState:
            xValueController.clear();
            final successState = state as PredictedSuccessState;
            return Container(
              height: 280,
              width: MediaQuery.of(context).size.width - 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                      blurRadius: 2,
                      color: Colors.grey)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: xValueController,
                      cursorColor: Colors.grey,
                      style: const TextStyle(color: Colors.teal),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1.0),
                          ),
                          hintText: 'feature label value (X)',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          minimumSize: const Size(double.maxFinite, 67),
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        newPredictionBloc.add(PredictButtonClickedEvent(
                            predictionDto: PredictionMakingDTO(
                                buildModel: buildModel,
                                xValue: double.parse(xValueController.text))));
                      },
                      child: const Center(
                        child: Text('Predict',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Prediction: ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                        ),
                        const SizedBox(width: 25),
                        Text(
                          '${successState.prediction.toStringAsFixed(2)} ',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
