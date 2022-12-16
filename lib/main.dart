import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/forms.dart';
import 'package:test/models/songmodel.dart';
import 'package:test/player/player.dart';
import 'package:test/songs.dart';

import 'home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SongModel()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: const Wrapper(),
    ),
  );
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Test')), body: const Home()),
      routes: {
        '/songs': (context) => const Songs(),
        '/form': (context) => const LoginForm(),
        '/player': (context) =>  Player()
      },
    );
  }
}
