import 'package:flutter/material.dart';

class StreamBloc extends StatelessWidget {
  const StreamBloc({super.key});

  Stream<int> streamNumber() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder Bloc"),
      ),
      // ============================================================
      body: StreamBuilder(
        stream: streamNumber(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
        },
      ),
      // ============================================================
    );
  }
}
