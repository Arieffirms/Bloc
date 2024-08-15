import 'package:bloc/bloc.dart';
import 'package:bloc_test/materi/bloc_stream.dart';
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
      home: StreamBloc(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void tambahdata() {
    emit(state + 1);
  }

  void kurangdata() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CounterCubit myCubit = CounterCubit(initialData: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Basic Bloc",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              // initialData: myCubit.initialData,
              stream: myCubit.stream,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                // return const Text(
                //   "Loading...",
                //   style: TextStyle(fontSize: 30),
                // );
                // } else {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 20),
                );
                // }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCubit.kurangdata();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCubit.tambahdata();
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
