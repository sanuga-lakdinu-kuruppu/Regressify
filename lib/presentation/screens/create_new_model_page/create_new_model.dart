import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regressify/data/models/data_points/data_points.dart';
import 'package:regressify/presentation/screens/model_training_screen/model_training_screen.dart';
import 'package:regressify/testing/test.dart';
import '../../../business_logic/create_new_model_page/bloc/new_model_page_bloc.dart';
import '../in_details_page/in_details_page.dart';

class NewModelPage extends StatefulWidget {
  const NewModelPage({super.key});

  @override
  State<NewModelPage> createState() => NewModelPageState();
}

class NewModelPageState extends State<NewModelPage> {
  late NewModelPageBloc newModelPageBloc;
  TextEditingController xValueController = TextEditingController();
  TextEditingController yValueController = TextEditingController();

  @override
  void initState() {
    newModelPageBloc = BlocProvider.of<NewModelPageBloc>(context);
    newModelPageBloc.add(InitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewModelPageBloc, NewModelClassPageState>(
      bloc: newModelPageBloc,
      listenWhen: (previous, current) => current is NewModelPageActionState,
      buildWhen: (previous, current) => current is! NewModelPageActionState,
      listener: (context, state) {
        if (state is AddToListSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('New data point is added')));
        } else if (state is ModelTrainingSucessActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CreatedModelInDetailsPage(buildModel: state.buildModel)));
        }
        if (state is TrainingDataNotFoundActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please first enter data points')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ModelTrainingState:
            return const Scaffold(
              body: ModelTrainingScreen(),
            );
          case NewModelPageLoadingState:
            return const CircularProgressIndicator();
          case NewModelPageLoadingSucessState:
            final sucessState = state as NewModelPageLoadingSucessState;
            xValueController.clear();
            yValueController.clear();

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Icon(
                    Icons.leaderboard,
                    color: Colors.teal,
                  ),
                ),
                actions: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.teal, // border color
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3), // border width
                      child: Container(
                        // or ClipRRect if you need to clip the content
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent, // inner circle color
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ), // inner content
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 25.0),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/OIP.jryuUgIHWL-1FVD2ww8oWgHaHa?pid=ImgDet&rs=1')),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/welcome.png'))),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Hello,',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontFamily: 'Lumanosimo')),
                              Text('Kaushi',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontFamily: 'Lumanosimo')),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lets begin',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal)),
                                  Text('Add new data points to train the model',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.teal)),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                height: 390,
                                width: MediaQuery.of(context).size.width - 50,
                                decoration: const BoxDecoration(
                                  color: Colors.teal,
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
                                      Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/folder.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          const Text('Add Data Points',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: xValueController,
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0),
                                              ),
                                              hintText:
                                                  'Feature label data (X value)',
                                              hintStyle: TextStyle(
                                                  color: Colors.white60)),
                                        ),
                                      ),
                                      const SizedBox(height: 0),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: yValueController,
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0),
                                              ),
                                              hintText:
                                                  'Target label data (Y value)',
                                              hintStyle: TextStyle(
                                                  color: Colors.white60)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                              minimumSize: const Size(
                                                  double.maxFinite, 67),
                                              backgroundColor: Colors.white,
                                              foregroundColor: Colors.teal),
                                          onPressed: () {
                                            newModelPageBloc.add(
                                              AddToListButtonClickedEvent(
                                                dataPoints: DataPoints(
                                                  id: sucessState
                                                      .dataPoints.length,
                                                  xValue: double.parse(
                                                      xValueController.text),
                                                  yValue: double.parse(
                                                      yValueController.text),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Center(
                                            child: Text('Add to List',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Training Data table',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal)),
                                  Text('Exisiting points to train the model',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.teal)),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                height:
                                    100 + sucessState.dataPoints.length * 50,
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
                                  child: ListView(
                                    children: [_createDataTable()],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width - 50,
                                        67),
                                    backgroundColor: Colors.amber,
                                    foregroundColor: Colors.white),
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Edit configurations',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width - 50,
                                        67),
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white),
                                onPressed: () {
                                  newModelPageBloc
                                      .add(TrainTheModelButtonClickedEvent());
                                },
                                child: const Center(
                                  child: Text('Train the model',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                        ],
                      ),
                    ),
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

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataRow> _createRows() {
    return dataPoints
        .map((e) => DataRow(cells: [
              DataCell(Text(e['id'].toString(),
                  style: const TextStyle(color: Colors.teal))),
              DataCell(Text(e['xValue'].toString(),
                  style: const TextStyle(color: Colors.teal))),
              DataCell(Text(e['yValue'].toString(),
                  style: const TextStyle(color: Colors.teal)))
            ]))
        .toList();
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
          label: Text(
        'ID',
        style: TextStyle(color: Colors.teal),
      )),
      const DataColumn(
          label: Text('Feature ', style: TextStyle(color: Colors.teal))),
      const DataColumn(
          label: Text('Target ', style: TextStyle(color: Colors.teal)))
    ];
  }
}
