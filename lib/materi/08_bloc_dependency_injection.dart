import 'package:bloc_test/materi/08_bloc_dependency_injection/bloc/counter.dart';
import 'package:bloc_test/materi/08_bloc_dependency_injection/widgets/merah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BlocDependencyInjectionLearn extends StatelessWidget {
  BlocDependencyInjectionLearn({super.key});

  @override
  Widget build(BuildContext context) {
    // final myCounter = BlocProvider.of<CounterApp>(context);
    final myCounter = context.read<CounterApp>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Dependency Injection"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  // decrement
                  myCounter.decrement();
                },
                splashColor: Colors.black,
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Merah(),
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  // increment
                  myCounter.increment();
                },
                splashColor: Colors.black,
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
