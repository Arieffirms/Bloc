import '../../08_bloc_dependency_injection/bloc/counter.dart';
import '../404/404.dart';
import '../others/other.dart';
import '../provider_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final mycounter = CounterApp();

class MyRouters {
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: const BlocAccessLearn(),
          ),
        );

      case '/other':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: const OtherPages(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
