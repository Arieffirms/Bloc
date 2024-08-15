// import 'package:bloc_test/materi/02_bloc_cubit.dart';
// import 'package:bloc_test/materi/03_bloc_observer_cubit.dart';
import 'package:bloc_test/materi/04_bloc_builder.dart';
// import 'package:bloc_test/materi/bloc_stream.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuildersLearn(),
    );
  }
}
