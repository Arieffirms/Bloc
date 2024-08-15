import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlocProviders extends StatelessWidget {
  BlocProviders({super.key});

  CounterCubit myCubit = CounterCubit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Basic"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int?>(
              initialData: myCubit.initialized,
              stream: myCubit.stream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => myCubit.kurangData(),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () => myCubit.tambahdata(),
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit(this.initialized) : super(0);

  int initialized;
  int? current;
  int? next;

  void tambahdata() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Observer
  // - Perubahan (OnChange)
  // - Erorr (OnError)

  // Bloc fitur observer data
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
