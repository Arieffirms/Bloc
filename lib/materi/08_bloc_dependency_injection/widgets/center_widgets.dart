import 'package:bloc_test/materi/08_bloc_dependency_injection/widgets/data_widgets.dart';
import 'package:flutter/material.dart';

class CenterWidgets extends StatelessWidget {
  const CenterWidgets({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(child: DataWidgets());
  }
}
