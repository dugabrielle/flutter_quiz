import 'package:flutter/material.dart';
import 'package:flutter_quizz/src/ui/pages/boas_vindas.dart';
import 'package:flutter_quizz/src/ui/pages/home.dart';
import 'package:flutter_quizz/src/ui/pages/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Doit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/boasVindas',
      routes: {
        '/boasVindas': (context) => const BoasVindas(),
        '/home': (context) => const HomePage(),
        '/perfil': (context) => const PerfildoUsuario(),
      },
    );
  }
}
