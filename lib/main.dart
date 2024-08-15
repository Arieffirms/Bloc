// import 'package:bloc_test/materi/02_bloc_cubit.dart';
// import 'package:bloc_test/materi/03_bloc_observer_cubit.dart';
// import 'package:bloc_test/materi/04_bloc_builder.dart';
// import 'package:bloc_test/materi/05_bloc_consumer.dart';
// import 'package:bloc_test/materi/bloc_stream.dart';
// import 'package:bloc_test/materi/06_bloc_listener%20copy.dart';
import 'package:bloc_test/materi/04_bloc/counter.dart';
import 'package:bloc_test/materi/07_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProviderLearn(),
      ),
    );
  }
}
