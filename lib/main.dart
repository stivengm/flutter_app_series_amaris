import 'package:flutter/material.dart';
import 'package:flutter_app_series_amaris/core/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app_series_amaris/core/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_app_series_amaris/core/paths/app_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: <BlocProvider> [
        BlocProvider<LoginBloc>(create: ( _ ) => LoginBloc()),
        BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc())
      ],
      child: _materialApp(),
    );
  }

  MaterialApp _materialApp() => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: routesApp(),
  );
}

// API 48f78c52c635970fef68388e26cf342b
