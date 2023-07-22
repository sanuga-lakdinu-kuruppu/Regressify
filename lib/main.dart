import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regressify/business_logic/create_new_model_page/bloc/new_model_page_bloc.dart';

import 'business_logic/in_detail_page/bloc/in_details_page_bloc.dart';
import 'business_logic/main_page/bloc/main_page_bloc.dart';
import 'presentation/main_page/main_page.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainPageBloc(),
          ),
          BlocProvider(
            create: (context) => NewModelPageBloc(),
          ),
          BlocProvider(
            create: (context) => InDetailsPageBloc(),
          ),
        ],
        child: const MyApp(),
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Regressify',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainPage(),
    );
  }
}
