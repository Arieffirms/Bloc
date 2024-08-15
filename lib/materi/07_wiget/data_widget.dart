import 'package:bloc_test/materi/07_wiget/center_widget.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: CenterWidget(),
    );
  }
}
