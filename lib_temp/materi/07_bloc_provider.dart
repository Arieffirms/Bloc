import '04_bloc/counter.dart';
import '07_wiget/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BlocProviderLearn extends StatelessWidget {
  const BlocProviderLearn({super.key});

  // ini adalah initial counter data
  // Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {

     // class yang sama dengan class + / -
    Counter myCounter = BlocProvider.of<Counter>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // PushButton -
              Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                child: InkWell(
                  onTap: () => myCounter.decrement(),
                  borderRadius: BorderRadius.circular(15),
                  child: const SizedBox(
                      height: 100,
                      width: 70,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                ),
              ),
              // widget data counter
              DataWidget(),
              // PushButton +
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => myCounter.increment(),
                  // highlightColor: Colors.amber,
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
