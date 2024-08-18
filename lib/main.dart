import 'package:bloc_test/bloc/counter.dart';
import 'package:bloc_test/bloc/theme.dart';
import 'package:bloc_test/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final myTheme = ThemeBloc();

  final allProvider = [
    BlocProvider(
      create: (context) => CounterBloc(),
    ),
    BlocProvider(
      create: (context) => ThemeBloc(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: allProvider,
      child: BlocBuilder<ThemeBloc, bool>(
        bloc: myTheme,
        builder: (context, state) {
          return MaterialApp(
            theme: state ? ThemeData.light() : ThemeData.dark(),
            home: BlocProvider(
              create: (BuildContext context) => CounterBloc(),
              child: const HomePage(),
            ),
          );
        },
      ),
    );

    // bisa juga menggunakan cara ini

    // return BlocProvider(
    //   create: (context) => myTheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: myTheme,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state ? ThemeData.light() : ThemeData.dark(),
    //         home: BlocProvider(
    //           create: (BuildContext context) => CounterBloc(),
    //           child: const HomePage(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
