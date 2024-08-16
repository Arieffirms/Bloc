import 'package:bloc_test/materi/08_bloc_dependency_injection/widgets/biru.dart';
import 'package:flutter/material.dart';

class Kuning extends StatelessWidget {
  const Kuning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.amber,
      child: Biru(),
    );
  }
}
