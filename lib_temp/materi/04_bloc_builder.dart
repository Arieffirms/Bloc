import '04_bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BlocBuildersLearn extends StatelessWidget {
  BlocBuildersLearn({super.key});
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: myCounter,
            buildWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Text(
                "${state}",
                style: const TextStyle(fontSize: 50),
              );
            },
          ),
          // StreamBuilder<int>(
          //   initialData: myCounter.init,
          //   stream: myCounter.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       "${snapshot.data}",
          //       style: const TextStyle(fontSize: 50),
          //     );
          //   },
          // ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
