import '../bloc/counter.dart';
import '../bloc/theme.dart';
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
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, state) {
            return state
                ? const Icon(Icons.theater_comedy)
                : const Icon(Icons.theater_comedy_outlined);
          },
        ),
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
            MultiBlocListener(
              listeners: [
                // buat Listener theme
                BlocListener<ThemeBloc, bool>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Theme Gelap Aktif ==> $state"),
                      duration: const Duration(seconds: 1),
                    ));
                  },
                  listenWhen: (previous, current) {
                    if (current == false) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
                // unutk mengListener counter
                BlocListener<CounterBloc, int>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Di atas 10 ==> $state"),
                      duration: const Duration(seconds: 1),
                    ));
                  },
                  listenWhen: (previous, current) {
                    if (current > 10) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                )
              ],
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text("$state", style: const TextStyle(fontSize: 50));
                },
              ),
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
