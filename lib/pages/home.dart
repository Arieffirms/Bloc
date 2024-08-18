import 'package:bloc_test/bloc/counter.dart';
import 'package:bloc_test/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mycounter = context.read<CounterBloc>();
    final myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Dependency Injection"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myTheme.changeTheme();
        },
        child: const Icon(Icons.theater_comedy),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  mycounter.remove();
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
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text("$state", style: const TextStyle(fontSize: 50));
              },
            ),
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  // increment
                  mycounter.add();
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
