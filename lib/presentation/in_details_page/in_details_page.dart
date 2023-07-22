import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regressify/business_logic/in_detail_page/bloc/in_details_page_bloc.dart';
import 'package:regressify/data/models/models/created_model.dart';

class CreatedModelInDetailsPage extends StatefulWidget {
  final BuildModel buildModel;
  const CreatedModelInDetailsPage({super.key, required this.buildModel});

  @override
  State<CreatedModelInDetailsPage> createState() =>
      // ignore: no_logic_in_create_state
      _CreatedModelInDetailsPageState(buildModel: buildModel);
}

class _CreatedModelInDetailsPageState extends State<CreatedModelInDetailsPage> {
  late BuildModel buildModel;
  final InDetailsPageBloc inDetailPageBloc = InDetailsPageBloc();

  _CreatedModelInDetailsPageState({required this.buildModel});
  @override
  void initState() {
    inDetailPageBloc.add(InDetailPageInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InDetailsPageBloc, InDetailsPageState>(
      bloc: inDetailPageBloc,
      listenWhen: (previous, current) => current is InDetailsPageActionState,
      buildWhen: (previous, current) => current is! InDetailsPageActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingSuccessState:
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
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.E0yEvGDqXof63L66vR1r3AHaEK?pid=ImgDet&rs=1'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 35),
                        const Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Final Result',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal)),
                                Text('The model you have created',
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
                              height: 100,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'y = f(x) = ${buildModel.result?[0].toStringAsFixed(2)}x + ${buildModel.result?[1].toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Lets make some predictins',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
