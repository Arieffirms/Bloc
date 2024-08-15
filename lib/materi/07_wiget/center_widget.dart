import 'package:bloc_test/materi/04_bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<Counter, int>(
        bloc: BlocProvider.of<Counter>(context),
        builder: (context, state) {
          return Text(
            "$state",
            style: const TextStyle(fontSize: 50, color: Colors.white),
          );
        },
      ),
    );
  }
}
