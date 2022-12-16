import 'package:flutter/material.dart';
import 'package:test/common/routeButton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: RouteButton('/songs', 'Songs'),
        ),
        Center(child: RouteButton('/form', 'Form')),
      ]);
  }
}