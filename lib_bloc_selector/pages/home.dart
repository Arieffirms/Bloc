// import 'package:bloc_test/bloc/user.dart';
import '../bloc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userB = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Secetion"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userB,
          //   builder: (context, state) {
          //     print("Build nama");
          //     return Text("Nama : ${state['name']}");
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userB,
          //   builder: (context, state) {
          //     print("Build umur");
          //     return Text("Umur : ${state['age']} Tahun");
          //   },
          // ),
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) {
              print("Text Nama => Rebuild");
              return Text("Nama : $state");
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state['age'],
            builder: (context, state) {
              print("Text Umur => Rebuild");
              return Text("Umur : $state");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (value) => userB.changeName(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    userB.changeAge(userB.state['age'] - 1);
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    userB.changeAge(userB.state['age'] + 1);
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
