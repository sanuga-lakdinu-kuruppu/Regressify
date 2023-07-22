import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regressify/presentation/screens/create_new_model_page/create_new_model.dart';
import '../../../business_logic/main_page/bloc/main_page_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageBloc mainBloc;
  @override
  void initState() {
    mainBloc = BlocProvider.of<MainPageBloc>(context);
    mainBloc.add(InitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainPageBloc, MainPageState>(
      bloc: mainBloc,
      listener: (context, state) {
        if (state is NavigateToCreateModelPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewModelPage()));
        }
      },
      listenWhen: (previous, current) => current is MainPageActionState,
      buildWhen: (previous, current) => current is! MainPageActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case LoadingSucessState:
            return Scaffold(
              backgroundColor: Colors.teal,
              body: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 38.0, left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Author',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    fontFamily: 'Lumanosimo'),
                              ),
                              Text('Sanuga Kuruppu',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white54,
                                  )),
                              Text('National Institute of Business Management',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white54))
                            ],
                          ),
                          Icon(
                            Icons.favorite,
                            size: 35,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Unleash the Power',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Lumanosimo')),
                              Text('Predictive Insights . . ',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Lumanosimo'))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Machine Learning',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          Text('Linear Regression',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            height: 350,
                            width: 250,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/lamp.png'))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Row(
                        children: [
                          Text('Introduction',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Row(
                        children: [
                          SizedBox(
                            width: 360,
                            child: Text(
                              'Discover the untapped potential of your data through Regressifys intuitive one-variable linear regression model. Whether you re an aspiring data scientist, a business professional, or an enthusiast looking to gain valuable insights, our app brings the power of predictive modeling to your fingertips.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white, // border color
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(3), // border width
                                  child: Container(
                                    // or ClipRRect if you need to clip the content
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.teal, // inner circle color
                                    ),
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ), // inner content
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white, // border color
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(3), // border width
                                  child: Container(
                                    // or ClipRRect if you need to clip the content
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.teal, // inner circle color
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        mainBloc.add(
                                            MainPageNavigateToModelCreatPageButtonClickedEvent());
                                      },
                                      icon: const Icon(Icons.next_plan,
                                          color: Colors.white),
                                    ), // inner content
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white, // border color
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3), // border width
                              child: Container(
                                // or ClipRRect if you need to clip the content
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.teal, // inner circle color
                                ),
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                ), // inner content
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
