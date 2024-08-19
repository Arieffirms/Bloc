import '../08_bloc_dependency_injection/bloc/counter.dart';
import '../08_bloc_dependency_injection/widgets/merah.dart';
import 'others/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BlocProviderValueLearn extends StatelessWidget {
  const BlocProviderValueLearn({super.key});

  @override
  Widget build(BuildContext context) {
    // final myCounter = BlocProvider.of<CounterApp>(context);
    final myCounter = context.read<CounterApp>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Dependency Injection"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            // builder: (context) => const OtherPage(),
            builder: (context) => BlocProvider.value(
              value: myCounter,
              child: const OtherPage(),
            ),
          ));
        },
        child: const Icon(Icons.arrow_forward),
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
            const Merah(),
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
