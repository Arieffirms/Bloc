import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CubitLearn extends StatelessWidget {
  CubitLearn({super.key});

  CounterCubit myCubit = CounterCubit(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Basic"),
      ),
      body: Column(
        children: [
          StreamBuilder<int>(
              stream: myCubit.stream,
              initialData: myCubit.initial = 10,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              }),
          Row(
            children: [
              IconButton(
                  onPressed: () => myCubit.kurangData(),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () => myCubit.tambahdata(),
                  icon: const Icon(Icons.add))
            ],
          ),
        ],
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit(this.initial) : super(10);
  int initial;

  void tambahdata() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}
