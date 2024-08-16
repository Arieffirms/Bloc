import 'package:bloc_test/materi/08_bloc_dependency_injection/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataWidgets extends StatelessWidget {
  const DataWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final myCounter = BlocProvider.of<CounterApp>(context);
    final myCounter = context.read<CounterApp>();
    return BlocBuilder<CounterApp, int>(
      bloc: myCounter,
      builder: (context, state) {
        return Text(
          "$state",
          style: const TextStyle(fontSize: 50, color: Colors.white),
        );
      },
    );
  }
}
