// import 'package:bloc_test/materi/02_bloc_cubit.dart';
// import 'package:bloc_test/materi/03_bloc_observer_cubit.dart';
// import 'package:bloc_test/materi/04_bloc_builder.dart';
// import 'package:bloc_test/materi/05_bloc_consumer.dart';
// import 'package:bloc_test/materi/bloc_stream.dart';
// import 'package:bloc_test/materi/06_bloc_listener%20copy.dart';
// import 'package:bloc_test/materi/07_bloc_provider.dart';
// import 'package:bloc_test/materi/08_bloc_dependency_injection.dart';
import 'materi/10_bloc_access/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = MyRouters();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BlocProvider(
      //   create: (context) => CounterApp(),
      //   child: const BlocProviderValueLearn(),
      // ),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => BlocProvider.value(
      //         value: mycounter,
      //         child: const BlocAccessLearn(),
      //       ),
      //   "/otherpage": (context) => BlocProvider(
      //         create: (context) => mycounter,
      //         child: const OtherPages(),
      //       ),
      // },

      onGenerateRoute: router.onRoute,
    );
  }
}
